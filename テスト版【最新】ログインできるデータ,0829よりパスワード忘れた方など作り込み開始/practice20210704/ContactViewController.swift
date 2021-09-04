//
//  ContactViewController.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/08/22.
//

import UIKit
import WebKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "https://www.google.com") {
            let request = NSURLRequest(url: url as URL)
            webview.load(request as URLRequest)
        }
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
