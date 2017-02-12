//
//  WeatherScreenInteractor.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: Typealiases

fileprivate typealias Private = WeatherScreenInteractor


// MARK: Classes

final class WeatherScreenInteractor {}

fileprivate extension Private {
	
	
	
	
}

extension WeatherScreenInteractor: WeatherScreenPresenterToInteractor {
	
	func requestWeather(forCity city: City, onCompletion: @escaping (_ response: WeatherScreenResponseModel) -> Void, onError: @escaping (_ error: String) -> Void) {
		WeatherAPIService.requestWeather(for: city, onSuccess: { json in
			onCompletion(WeatherScreenResponseModelBuilder.buildModel(from: json))
		}, onError: { error in
			onError(error.localizedDescription)
		})
	}
	
	
}
