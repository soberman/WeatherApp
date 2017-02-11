//
//  WeatherScreenBuilder.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit

final class WeatherScreenBuilder {
	
	class func buildWeatherScreen() -> UIViewController {
		let wireframe = WeatherScreenWireframe()
		let interactor = WeatherScreenInteractor()
		let presenter = WeatherScreenPresenter(interactor: interactor, wireframe: wireframe)
		let viewController = WeatherScreenViewController(withPresenter: presenter)
		
		presenter.setView(viewController)
		
		return viewController
	}
	
	
}
