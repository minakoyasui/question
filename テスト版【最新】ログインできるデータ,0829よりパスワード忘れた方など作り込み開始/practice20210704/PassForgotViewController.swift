//
//  PassForgotViewController.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/08/15.
//

import UIKit
import NCMB
import SwiftUI

class PassForgotViewController: UIViewController {

    @IBOutlet weak var mailaddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func soushin(_ sender: Any) {
        if let mail = mailaddress.text{
             NCMBUser.requestPasswordReset(mailAddress: mail)
         }
        NCMBUser.requestAuthenticationMailInBackground(mailAddress: mailaddress.text, callback: { result in
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
}

