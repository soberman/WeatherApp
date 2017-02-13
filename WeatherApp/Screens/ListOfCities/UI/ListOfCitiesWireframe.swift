//
//  ListOfCitiesWireframe.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


final class ListOfCitiesWireframe {

	fileprivate weak var maybePreviousWireframe: CityRecieveble?
	
	
	init(withReferencedWireframe wireframe: CityRecieveble) {
		self.maybePreviousWireframe = wireframe
	}

}

extension ListOfCitiesWireframe: ListOfCitiesPresenterToWireframe {

	func hide(_ viewController: UIViewController, withSelectedCity city: City) {
		viewController.dismiss(animated: true, completion: nil)
		maybePreviousWireframe?.didSelectCity(city)
	}
	
	
}
