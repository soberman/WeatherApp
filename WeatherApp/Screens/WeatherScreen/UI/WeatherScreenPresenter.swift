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
	
	fileprivate let interactor: WeatherScreenPresenterToInteractorInterface
	fileprivate let wireframe: WeatherScreenPresenterToWireframeInterface
	fileprivate let dispatcher: WeatherScreenDispatcher
	
	fileprivate weak var view: WeatherScreenPresenterToViewInterface?
	
	
	init(interactor: WeatherScreenPresenterToInteractorInterface, wireframe: WeatherScreenPresenterToWireframeInterface, dispatcher: WeatherScreenDispatcher) {
		self.interactor = interactor
		self.wireframe = wireframe
		self.dispatcher = dispatcher
	}
	
	
}

extension AccessibleFromOutside {
	
	func setView(_ view: WeatherScreenPresenterToViewInterface) {
		self.view = view
	}
	
	
}

fileprivate extension Private {
	
	func buildViewModel(from response: WeatherScreenResponseModel, onComplete: @escaping (_ viewModel: WeatherScreenViewModel) -> Void) {
		dispatcher.dispatch(on: .backgroundConcurent) { [unowned self] in
			let viewModel = WeatherScreenViewModelBuilder.buildViewModel(from: response)
			self.dispatcher.dispatch(on: .main) {
				onComplete(viewModel)
			}
		}
	}
	
	
}

extension WeatherScreenPresenter: WeatherScreenViewToPresenterInterface {
	
	func didLoadView() {
		self.interactor.requestWeather(withCompletion: { [unowned self] (response) in
			self.buildViewModel(from: response, onComplete: { (viewModel) in
				self.view?.updateUI(withModel: viewModel)
			})
		})
	}
	
	func didTapSettingsButton() {
		
	}
	
	
}
