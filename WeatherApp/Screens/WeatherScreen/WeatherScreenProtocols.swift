//
//  WeatherScreenProtocols.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

protocol WeatherScreenPresenterToViewInterface: class, ErrorShowable {
	func updateUI(withModel viewModel: WeatherScreenViewModel)
}

protocol WeatherScreenViewToPresenterInterface: class {
	func didLoadView()
	func didTapSettingsButton()
}

protocol WeatherScreenPresenterToInteractorInterface: class {
	func requestWeather(forCity city: City, onCompletion: @escaping (_ response: WeatherScreenResponseModel) -> Void, onError: @escaping (_ error: String) -> Void)
}

protocol WeatherScreenPresenterToWireframeInterface: class {
	
}
