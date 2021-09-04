//
//  MovieViewController.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/08/14.
//

import UIKit
import WebKit

class MovieViewController: UIViewController {
    var url: String = ""

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cookingUrl = URL(string: url)
        let request = URLRequest(url:cookingUrl!)
        webview.load(request)

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
