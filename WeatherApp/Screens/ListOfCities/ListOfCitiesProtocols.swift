//
//  ListOfCitiesProtocols.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

protocol CityRecieveble: class {
	func didSelectCity(_ city: City)
}

protocol ListOfCitiesPresenterToView: class, ErrorShowable {
	func updateUI(withModel viewModel: ListOfCitiesViewModel)
}

protocol ListOfCitiesViewToPresenter: class {
	func didLoadView()
	func didSelectCity(withName cityName: String)
}

protocol ListOfCitiesPresenterToInteractor: class {
	func listOfCities() -> ListOfCitiesModel
}

protocol ListOfCitiesPresenterToWireframe: class {
	func hide(_ viewController: UIViewController, withSelectedCity city: City)
}
