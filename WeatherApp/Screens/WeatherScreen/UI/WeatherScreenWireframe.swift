//
//  WeatherScreenWireframe.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

final class WeatherScreenWireframe {}

extension WeatherScreenWireframe: WeatherScreenPresenterToWireframe {
	
	func showListOfCitiesModule(on viewController: UIViewController) {
		let listOfCitiesViewController = ListOfCitiesModuleBuilder.buildListOfCitiesModule()
		viewController.present(listOfCitiesViewController, animated: true, completion: nil)
	}
	
	
}
