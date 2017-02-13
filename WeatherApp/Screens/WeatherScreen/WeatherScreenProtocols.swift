//
//  WeatherScreenProtocols.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

protocol WeatherScreenPresenterToView: class, ErrorShowable {
	func updateUI(withModel viewModel: WeatherScreenViewModel)
	func showPreloader()
	func hidePreloader()
}

protocol WeatherScreenViewToPresenter: class {
	func didLoadView()
	func didTapSettingsButton()
}

protocol WeatherScreenPresenterToInteractor: class {
	func requestWeather(forCity city: City, onCompletion: @escaping (_ response: WeatherScreenResponseModel) -> Void, onError: @escaping (_ error: String) -> Void)
}

protocol WeatherScreenPresenterToWireframe: class {
	func showListOfCitiesModule(on viewController: UIViewController)
}

protocol WeatherScreenWireframeToPresenter: class {
	func cityHasBeenChanged(to city: City)
}
