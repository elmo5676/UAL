// ********************** AppMain+Extensions *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/30/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** AppMain+Extensions *********************************


import UIKit
import SwiftUI

public class FSAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return true
    }
    
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = FSSceneDelegate.self
        return sceneConfig
      }
}


public class FSSceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
    
    public var window: UIWindow?

    public func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        print("************* \(#file.components(separatedBy: "/").last!) ::: \(#line) ******************")
//      guard let windowScene = scene as? UIWindowScene else { return }
//      let window = UIWindow(windowScene: windowScene)
//      window.rootViewController = UIHostingController(rootView: )
//      self.window = window
//      window.makeKeyAndVisible()
    }

    public func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let urlContext = URLContexts.first else { return }
        print(urlContext.url)
        // MARK: 👉 Do the thing with the OFP here
    }
    
    
    public func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    public func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    public func sceneWillResignActive(_ scene: UIScene) {
    }
    
}
