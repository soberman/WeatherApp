//
//  WeatherScreenResponseModelBuilder.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

struct WeatherScreenResponseModelBuilder {
	
	private init() {}
	
	
	static func buildModel(from json: [String : Any]) -> WeatherScreenResponseModel {
		let maybeWeatherDict = json["weather"] as? [String : Any]
		let maybeWeatherDescription = maybeWeatherDict?["description"] as? String
		let maybeIconID = maybeWeatherDict?["icon"] as? String
		
		let maybeMainDict = json["main"] as? [String : Any]
		let maybeAverageTemp = maybeMainDict?["temp"] as? Int
		let maybeMinTemp = maybeMainDict?["temp_min"] as? Int
		let maybeMaxTemp = maybeMainDict?["temp_max"] as? Int
		
		let maybeCityName = json["name"] as? String
		
		return WeatherScreenResponseModel(maybeCityName: maybeCityName,
		                                  maybeWeatherDescription: maybeWeatherDescription,
		                                  maybeIconID: maybeIconID,
		                                  maybeAverageTemp: maybeAverageTemp,
		                                  maybeMinTemp: maybeMinTemp,
		                                  maybeMaxTemp: maybeMaxTemp)
	}
	
	
}
