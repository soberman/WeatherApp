//
//  WeatherScreenViewModelBuilder.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

struct WeatherScreenViewModelBuilder {
	
	private init() {}
	
	
	static func buildViewModel(from responseModel: WeatherScreenResponseModel) -> WeatherScreenViewModel {
		var maybeIconURL: URL?
		if let iconId = responseModel.maybeIconID {
			maybeIconURL = URL(string: WeatherAPIService.weatherIconEndpoint + iconId + ".png")
		}
		
		return WeatherScreenViewModel(cityName: responseModel.maybeCityName ?? "Your current location",
		                              weatherDescription: responseModel.maybeWeatherDescription ?? "",
		                              weatherIcon: maybeIconURL,
		                              averageTemperature: responseModel.maybeAverageTemp != nil ? String(responseModel.maybeAverageTemp!) : "0",
		                              maxTemperature: responseModel.maybeMaxTemp != nil ? String(responseModel.maybeMaxTemp!) : "0",
		                              minTemperature: responseModel.maybeMinTemp != nil ? String(responseModel.maybeMinTemp!) : "0")
	}
	
	
}
