//
//  WeatherScreenPresenter.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: Typealiases

fileprivate typealias AccessibleFromOutside = WeatherScreenPresenter
fileprivate typealias Private = WeatherScreenPresenter


// MARK: Classes

final class WeatherScreenPresenter {
	
	fileprivate let interactor: WeatherScreenPresenterToInteractor
	fileprivate let wireframe: WeatherScreenPresenterToWireframe
	fileprivate let dispatcher: WeatherScreenDispatcher
	
	fileprivate weak var view: WeatherScreenPresenterToView?
	fileprivate var currentCity: City = .dnepr
	
	
	init(interactor: WeatherScreenPresenterToInteractor, wireframe: WeatherScreenPresenterToWireframe, dispatcher: WeatherScreenDispatcher) {
		self.interactor = interactor
		self.wireframe = wireframe
		self.dispatcher = dispatcher
	}
	
	
}

extension AccessibleFromOutside {
	
	func setView(_ view: WeatherScreenPresenterToView) {
		self.view = view
	}
	
	
}

fileprivate extension Private {
	
	func buildViewModel(from responseModel: WeatherScreenResponseModel, onComplete: @escaping (_ viewModel: WeatherScreenViewModel) -> Void) {
		dispatcher.dispatch(on: .backgroundConcurent) { [unowned self] in
			let viewModel = WeatherScreenViewModelBuilder.buildViewModel(from: responseModel)
			self.dispatcher.dispatch(on: .main) {
				onComplete(viewModel)
			}
		}
	}
	
	func requestWeather(for city: City) {
		self.interactor.requestWeather(forCity: city, onCompletion: { [unowned self] (response) in
			self.buildViewModel(from: response, onComplete: { (viewModel) in
				self.view?.updateUI(withModel: viewModel)
				self.view?.hidePreloader()
			})
		}, onError: { [unowned self] errorText in
			self.view?.hidePreloader()
			self.view?.showError(errorDescription: errorText, confirmTitle: "Retry", onConfirm: {
				self.retryRequestingWeather(for: city)
			})
		})
	}
	
	func retryRequestingWeather(for city: City) {
		requestWeather(for: city)
	}
	
	
}

extension WeatherScreenPresenter: WeatherScreenViewToPresenter {
	
	func didLoadView() {
		view?.showPreloader()
		requestWeather(for: currentCity)
	}
	
	func didTapSettingsButton() {
		guard let viewController = view as? UIViewController else { return }
		wireframe.showListOfCitiesModule(on: viewController)
	}
	
	
}

extension WeatherScreenPresenter: WeatherScreenWireframeToPresenter {
	
	func cityHasBeenChanged(to city: City) {
		guard currentCity != city else { return }
		currentCity = city
		requestWeather(for: city)
	}
	
	
}
