//
//  ViewController.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/07/04.
//

import UIKit
import NCMB

class ViewController: UIViewController {
    
    @IBOutlet weak var usermail: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var jidou: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("test")
       
        guard let user = UserDefaults.standard.string(forKey: "user") else{
            return
        }
        guard let pass = UserDefaults.standard.string(forKey: "pass") else{
            return
        }
        NCMBUser.logInInBackground(mailAddress: user, password: pass, callback: { result in
                switch result {
                    case .success:
                        // ログインに成功した場合の処理
                        
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "Top", sender: nil)
                            // メインスレッドで実行 UIの処理など
                        }
                        

                        
                    case let .failure(error):
                        // ログインに失敗した場合の処理
                        print("ログインに失敗しました: \(error)")
                }
            })
        
        
    }

    @IBAction func touroku(_ sender: Any) {
        performSegue(withIdentifier: "kaiintouroku", sender: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        let user = usermail.text
        let pass = password.text
        // メールアドレスとパスワードでログイン
        NCMBUser.logInInBackground(mailAddress: user!, password: pass!, callback: { result in
                switch result {
                    case .success:
                        // ログインに成功した場合の処理
                        print("ログインに成功しました")
                        // ログイン状況の確認
                        if let ncmbuser = NCMBUser.currentUser {
                            print("ログイン中のユーザー: \(ncmbuser.userName!)")
                            let kakinari: Bool? = ncmbuser["kakinari"]
                            if self.jidou.isOn{
                                UserDefaults.standard.set(pass, forKey: "pass")
                                UserDefaults.standard.set(user, forKey: "user")
                            }
                            
                            UserDefaults.standard.set(kakinari, forKey: "kakinari")
                        } else {
                            print("ログインしていません")
                        }
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "Top", sender: nil)
                            // メインスレッドで実行 UIの処理など
                        }
                        

                        
                    case let .failure(error):
                        // ログインに失敗した場合の処理
                        print("ログインに失敗しました: \(error)")
                }
            })
    }
    
    
    
    @IBAction func unwindTologin(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        UserDefaults.standard.set("", forKey: "pass")
        UserDefaults.standard.set("", forKey: "user")
    }

}

