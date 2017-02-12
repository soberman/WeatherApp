//
//  WeatherScreenProtocols.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

protocol WeatherScreenPresenterToViewInterface: class {
	func updateUI(withModel viewModel: WeatherScreenViewModel)
}

protocol WeatherScreenViewToPresenterInterface: class {
	func didLoadView()
	func didTapSettingsButton()
}

protocol WeatherScreenPresenterToInteractorInterface: class {
	func requestWeather(withCompletion onCompletion: (_ response: WeatherScreenResponseModel) -> Void)
}

protocol WeatherScreenPresenterToWireframeInterface: class {
	
}
