//
//  KaiintourokuViewController.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/07/04.
//

import UIKit
import NCMB

class KaiintourokuViewController: UIViewController {

    @IBOutlet weak var mail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touroku(_ sender: Any) {
        let email = mail.text
        let result = NCMBUser.requestAuthenticationMailInBackground(mailAddress: email!, callback: { result in
            switch result {
                case .success:
                    // 会員登録用メールの要求に成功した場合の処理
                    print("会員登録用メールの要求に成功しました")
                case let .failure(error):
                    // 会員登録用のメール要求に失敗した場合の処理
                    print("会員登録用メールの要求に失敗しました: \(error)")
            }
        })

        
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
