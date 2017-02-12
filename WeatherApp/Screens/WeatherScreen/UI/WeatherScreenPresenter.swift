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

extension WeatherScreenPresenter: WeatherScreenViewToPresenterInterface {
	
	func didLoadView() {
		
	}
	
	func didTapSettingsButton() {
		
	}
	
	
}
