//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 10/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = RootWireframe.buildInitialViewController()
		window?.makeKeyAndVisible()
		
		return true
	}


}

