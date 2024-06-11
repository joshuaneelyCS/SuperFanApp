//
//  AppDelegate.swift
//  SuperFan
//
//  Created by Joshua Neely on 11/5/19.
//  Copyright © 2019 Joshua Neely. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController

        if (UserDefaults.standard.value(forKey: "$fullName") as? String) == nil{
            //show the onboarding screen
            vc = storyboard.instantiateViewController(withIdentifier: "StartScreen")
            
            UserDefaults.standard.set(0, forKey:  "superfanProgress")
            
            print("did it")
            UserDefaults.standard.set("name", forKey:  "$fullName")

                                  
        } else {
            //show the main screen
            print("why")
            vc = storyboard.instantiateInitialViewController()!
                                  
        }
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()

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
