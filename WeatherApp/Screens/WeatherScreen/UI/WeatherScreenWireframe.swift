//
//  WeatherScreenWireframe.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: Typealiases

fileprivate typealias AccessibleFromOutside = WeatherScreenWireframe


// MARK: Classes

final class WeatherScreenWireframe {

	fileprivate weak var maybePresenter: WeatherScreenWireframeToPresenter?
	

}

extension AccessibleFromOutside {
	
	func setPresenter(_ presenter: WeatherScreenWireframeToPresenter) {
		maybePresenter = presenter
	}
	
	
}

extension WeatherScreenWireframe: WeatherScreenPresenterToWireframe {
	
	func showListOfCitiesModule(on viewController: UIViewController) {
		let listOfCitiesViewController = ListOfCitiesModuleBuilder.buildListOfCitiesModule(fromWireframe: self)
		viewController.present(listOfCitiesViewController, animated: true, completion: nil)
	}
	
	
}

extension WeatherScreenWireframe: CityRecieveble {
	
	func didSelectCity(_ city: City) {
		maybePresenter?.cityHasBeenChanged(to: city)
	}
	
	
}
