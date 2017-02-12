//
//  ListOfCitiesModuleBuilder.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

struct ListOfCitiesModuleBuilder {
	
	private init() {}
	
	
	static func buildListOfCitiesModule() -> UIViewController {
		let wireframe = ListOfCitiesWireframe()
		let interactor = ListOfCitiesInteractor()
		let presenter = ListOfCitiesPresenter(interactor: interactor, wireframe: wireframe)
		let viewController = ListOfCitiesViewController(withPresenter: presenter)
		
		return viewController
	}
	
	
}
