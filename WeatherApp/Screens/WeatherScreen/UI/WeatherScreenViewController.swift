//
//  WeatherScreenViewController.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit

final class WeatherScreenViewController: UIViewController {
	
	fileprivate let presenter: WeatherScreenViewToPresenterInterface
	
	
	// MARK: Lifecycle
	
	init(withPresenter presenter: WeatherScreenViewToPresenterInterface) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: Overrides
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}

extension WeatherScreenViewController: WeatherScreenPresenterToViewInterface {
	
}
