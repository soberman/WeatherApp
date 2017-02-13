//
//  ListOfCitiesViewModel.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

struct ListOfCitiesViewModel {
	
	let cellViewModels: [ListOfCitiesCellViewModel]
	private(set) var numberOfCells: Int {
		didSet {
			let maxCount = cellViewModels.count
			if numberOfCells > maxCount {
				self.numberOfCells = maxCount
			}
		}
	}
	
	
}

struct ListOfCitiesCellViewModel {
	
	let cityName: String
	
}
