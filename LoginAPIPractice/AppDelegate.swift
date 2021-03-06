//
//  AppDelegate.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit
import FBSDKCoreKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    //    configureInitialViewController()
    FirebaseApp.configure()
    GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
    
    ApplicationDelegate.shared.application(
      application,
      didFinishLaunchingWithOptions: launchOptions
    )
    
    return true
  }
  
  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let handled: Bool
    if url.absoluteString.contains("fb") {
      handled = ApplicationDelegate.shared.application(app, open: url, options: options)
    } else {
      handled = GIDSignIn.sharedInstance().handle(url)
    }
    return handled
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
  
//  func configureInitialViewController() {
//    var initialVC: UIViewController
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    if UserDefaults.standard.string(forKey: "token") != nil {
//      initialVC = storyboard.instantiateViewController(withIdentifier: "MainVC")
//    } else {
//      initialVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
//    }
//
//    window?.rootViewController = initialVC
//    window?.makeKeyAndVisible()
//  }


}

