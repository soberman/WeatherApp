//
//  ListOfCitiesInteractor.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

final class ListOfCitiesInteractor {}

extension ListOfCitiesInteractor: ListOfCitiesPresenterToInteractor {

	func listOfCities() -> ListOfCitiesModel {
		return ListOfCitiesModel(cities: [
			City.dnepr.rawValue,
			City.kharkiv.rawValue,
			City.kiev.rawValue,
			City.zaporozhye.rawValue
		])
	}


}
