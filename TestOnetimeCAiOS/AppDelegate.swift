// Copyright © VNPT-IT eGov. All right reversed.
// Author: Hoang Dinh Hoi
// Date: Feb 14, 2022

import UIKit
import OnetimeVNPTSmartCAFramework

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var onetimeCA: OnetimeVNPTSmartCA?;
    var partnerId = "VNPTSmartCAPartner-add1fb94-9629-4947-b7d8-f2671b04c747";

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.onetimeCA = OnetimeVNPTSmartCA(
            environment: OnetimeVNPTSmartCA.ENVIRONMENT.DEMO,
            partnerId: self.partnerId,
            lang: OnetimeVNPTSmartCA.LANG.VI);
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
