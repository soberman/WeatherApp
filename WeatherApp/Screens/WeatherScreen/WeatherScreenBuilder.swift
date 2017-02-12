//
//  WeatherScreenBuilder.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit

struct WeatherScreenModuleBuilder {
	
	private init() {}
	
	
	static func buildWeatherScreen() -> UIViewController {
		let dispatcher = WeatherScreenDispatcher()
		let wireframe = WeatherScreenWireframe()
		let interactor = WeatherScreenInteractor()
		let presenter = WeatherScreenPresenter(interactor: interactor, wireframe: wireframe, dispatcher: dispatcher)
		let viewController = WeatherScreenViewController(withPresenter: presenter)
		
		presenter.setView(viewController)
		
		return viewController
	}
	
	
}
