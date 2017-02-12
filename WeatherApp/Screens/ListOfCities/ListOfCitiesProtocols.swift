//
//  ListOfCitiesProtocols.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

protocol ListOfCitiesPresenterToView: class, ErrorShowable {
//	func updateUI(withModel viewModel: WeatherScreenViewModel)
}

protocol ListOfCitiesViewToPresenter: class {
	func didLoadView()
}

protocol ListOfCitiesPresenterToInteractor: class {
	
}

protocol ListOfCitiesPresenterToWireframe: class {
	
}
