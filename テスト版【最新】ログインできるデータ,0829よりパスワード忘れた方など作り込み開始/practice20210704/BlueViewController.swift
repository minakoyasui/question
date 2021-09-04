//
//  BlueViewController.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/07/11.
//

import UIKit
import NCMB

class BlueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var cookingDatas: [Data] = []
    func getdata(){
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "cooking")
        let result = query.find()
        switch result {
        case let .success(array):
            print("取得に成功しました 件数: \(array.count)")
            cookingDatas = []
            for data in array{
                let title: String? = data["title"]
                let setsumei: String? = data["setsumei"]
                let thumbnail: String? = data["thumbnail"]
                let movie: String? = data["movie"]
                let kakin: Bool? = data["kakin"]
                let koukaibi: String? = data["koukaibi"]
                let cookingdata = Data(title: title, setsumei: setsumei, thumbnail: thumbnail, movie: movie, kakin: kakin, koukaibi: koukaibi)
                cookingDatas.append(cookingdata)
            }
            tableView.reloadData()
    
        case let .failure(error):
            print("取得に失敗しました: \(error)")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookingDatas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: BlueTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! BlueTableViewCell
        // セルに表示する値を設定する
        //            cell.textLabel!.text = TODO[indexPath.row]
        cell.label1.text = cookingDatas[indexPath.row].title
        cell.label2.text = cookingDatas[indexPath.row].setsumei
        cell.label3.text = cookingDatas[indexPath.row].koukaibi
        // ファイル名の指定
        if let thumbnail =  cookingDatas[indexPath.row].thumbnail {
            let file : NCMBFile = NCMBFile(fileName: thumbnail)

            // ファイルの取得
            file.fetchInBackground(callback: { result in
                switch result {
                    case let .success(data):
                        print("取得に成功しました: \(data)")
                        let thumbnailImage = UIImage(data: data!)
                        DispatchQueue.main.async {
                            cell.imagebig.image = thumbnailImage
                            // メインスレッドで実行 UIの処理など
                        }
                        
                    case let .failure(error):
                        print("取得に失敗しました: \(error)")
                        return;
                }
            })
            
        }
        

//        cell.imageleft.image = UIImage(named: TODO[indexPath.row].image1)
//        cell.imageright.image = UIImage(named: TODO[indexPath.row].image2)
//        cell.imagebig.image = UIImage(named: TODO[indexPath.row].image3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = NCMBUser.currentUser {
            
            let kakinari: Bool? = user["kakinari"]
            guard let kakin = kakinari else{
                return
            }
            if kakin{
                let cookingData = cookingDatas[indexPath.row]
                performSegue(withIdentifier: "movie", sender: cookingData.movie)
            }
        }
        
            
                
            
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let url = sender as! String?
        let next = segue.destination as! MovieViewController
        next.url = url!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        // Do any additional setup after loading the view.
    }
    
    
        
       
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
struct Data {
    var title: String?
    var setsumei: String?
    var thumbnail: String?
    var movie: String?
    var kakin: Bool?
    var koukaibi: String?
}
