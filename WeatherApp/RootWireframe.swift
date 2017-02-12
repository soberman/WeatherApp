//
//  RootWireframe.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit

final class RootWireframe {
	
	class func buildInitialViewController() -> UIViewController {
		return WeatherScreenModuleBuilder.buildWeatherScreen()
	}
	
	
}
