//
//  AppDelegate.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/07/04.
//

import UIKit
import NCMB
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //アプリ名：madamekhako
        NCMB.initialize(applicationKey: "2c75b036a60c6953a798c1eeea3bb4f86e08f7dac554aed5f87c30eec1ee2e6c", clientKey: "576ea1653471aeb6591ce43ca62f01abd5bad3cd2f300bd374e5a2771e68eee0");
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

