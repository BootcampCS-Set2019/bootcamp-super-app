//
//  AppDelegate.swift
//  MagicApp
//
//  Created by matheus.filipe.bispo on 03/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//

import RecommendedCardsModule
import CardDetailModule
import Entities

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = RecommendedCardsModuleBuilder.buildRoot(delegate: self)
        window.makeKeyAndVisible()

        self.window = window
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}

extension AppDelegate: RecommendedCardsDelegate {
    func didTapCard(card: Card) {
        window?
            .rootViewController?
            .present(CardDetailModuleBuilder.buildRoot(card: card), animated: true)
    }
}
