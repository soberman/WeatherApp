//
//  ListOfCitiesPresenter.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

final class ListOfCitiesPresenter {
	
	fileprivate let interactor: ListOfCitiesPresenterToInteractor
	fileprivate let wireframe: ListOfCitiesPresenterToWireframe
	
	fileprivate weak var view: ListOfCitiesPresenterToView?
	
	
	init(interactor: ListOfCitiesPresenterToInteractor, wireframe: ListOfCitiesPresenterToWireframe) {
		self.interactor = interactor
		self.wireframe = wireframe
	}
	
}

extension ListOfCitiesPresenter: ListOfCitiesViewToPresenter {
	
	func didLoadView() {
		
	}
	
	
}
