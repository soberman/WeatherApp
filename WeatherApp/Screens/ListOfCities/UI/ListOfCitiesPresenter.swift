//
//  ListOfCitiesPresenter.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: Typealiases

fileprivate typealias AccessibleFromOutside = ListOfCitiesPresenter


// MARK: Classes

final class ListOfCitiesPresenter {
	
	fileprivate let interactor: ListOfCitiesPresenterToInteractor
	fileprivate let wireframe: ListOfCitiesPresenterToWireframe
	
	fileprivate weak var view: ListOfCitiesPresenterToView?
	
	
	init(interactor: ListOfCitiesPresenterToInteractor, wireframe: ListOfCitiesPresenterToWireframe) {
		self.interactor = interactor
		self.wireframe = wireframe
	}
	
}

extension AccessibleFromOutside {
	
	func setView(_ view: ListOfCitiesPresenterToView) {
		self.view = view
	}
	
	
}

extension ListOfCitiesPresenter: ListOfCitiesViewToPresenter {
	
	func didLoadView() {
		let model = interactor.listOfCities()
		let cellViewModels = model.cities.map({ ListOfCitiesCellViewModel(cityName: $0) })
		let viewModel = ListOfCitiesViewModel(cellViewModels: cellViewModels, numberOfCells: cellViewModels.count)
		
		view?.updateUI(withModel: viewModel)
	}
	
	func didSelectCity(withName cityName: String) {
		guard let city = City(rawValue: cityName), let viewController = view as? UIViewController else { return }
		wireframe.hide(viewController, withSelectedCity: city)
	}
	
	
}
