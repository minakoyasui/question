//
//  FirstViewController.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/08/14.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tap: UILabel!
    
    @IBOutlet weak var yajirushi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tap.text = "下の画像にタップしてスタート！"
        yajirushi.text = "↓↓↓"
        

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
