//
//  AppDelegate.swift
//  TestProject
//
//  Created by Rajaram on 26/02/20.
//  Copyright © 2020 Rajaram. All rights reserved.
//

import UIKit
import REIOSSDK
import UserNotifications

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let rootVc = ViewController()
        rootVc.view.backgroundColor = .red
//        window?.rootViewController = rootVc
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "nav")
        window?.rootViewController = controller

        
        initIntSdk()
        return true
    }
    
    private func initIntSdk() {
        REiosHandler.printAny = true;
        REiosHandler.isBaseUrl = 1;
        REiosHandler.debug = true;
        REiosHandler.initWithApi(apiKey: "a27ca05b-8ad0-475c-856f-f5337f231ccd", registerNotificationCategory: []);
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
        let tokenString = deviceToken.reduce("") { string, byte in
            string + String(format: "%02X", byte)
        }
        UserDefaults.standard.set(tokenString, forKey: "token")
         
        UserDefaults.standard.synchronize();
        
    }
    


}

@available(iOS 13.0, *)
extension AppDelegate {
    
    //MARK: - Open link delegate
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        print(url)
        
        return true
    }
}

