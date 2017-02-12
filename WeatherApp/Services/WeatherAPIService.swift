//
//  WeatherAPIService.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: Typealiases

fileprivate typealias Private = WeatherAPIService


// MARK: Enums

enum City: String {
	case dnepr = "Dnipropetrovsk"
	case kiev = "Kiev"
	case kharkiv = "Kharkiv"
	case zaporozhye = "Zaporizhzhya"
}

enum WeatherApiServiceError: Error {
	case couldNotSerializeJSON
	case noValidEnpointURL
}


// MARK: Structs

struct WeatherAPIService {

	static let weatherIconEndpoint = "http://openweathermap.org/img/w/"
	
	fileprivate static let apiKey = "aed6392a9c12c584bf9d7e298846751c"
	fileprivate static let apiEndpoint = "http://api.openweathermap.org/data/2.5/weather"
	fileprivate static let session = URLSession(configuration: .ephemeral)
	
	
	static func requestWeather(for city: City, onSuccess: @escaping (_ response: [String: Any]) -> Void, onError: @escaping (_ error: Error) -> Void) {
		guard let URL = configuredURL(forCity: city) else {
			onError(WeatherApiServiceError.noValidEnpointURL)
			return
		}
		
		session.dataTask(with: URL) { (maybeData, maybeResponse, maybeError) in
			if let error = maybeError {
				onError(error)
				return
			}
			if let json = serialize(maybeData) as? [String : Any] {
				onSuccess(json)
			} else {
				onError(WeatherApiServiceError.couldNotSerializeJSON)
			}
		}.resume()
	}
	
	
}

fileprivate extension Private {
	
	static func configuredURL(forCity city: City) -> URL? {
		guard var endpoint = URLComponents(string: apiEndpoint) else { return nil }
		endpoint.queryItems = [
			URLQueryItem(name: "q", value: city.rawValue),
			URLQueryItem(name: "units", value: "metric"),
			URLQueryItem(name: "appid", value: apiKey)
		]
		
		return endpoint.url
	}
	
	static func serialize(_ maybeData: Data?) -> Any? {
		guard let data = maybeData else { return nil }
		do {
			return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
		} catch _ { return nil }
	}
	
	
}
