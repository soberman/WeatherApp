//
//  ListOfCitiesViewController.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: Typealiases

fileprivate typealias Private_InitialConfiguration = ListOfCitiesViewController

final class ListOfCitiesViewController: UIViewController {
	
	fileprivate let presenter: ListOfCitiesViewToPresenter
	
	
	// MARK: Lifecycle
	
	init(withPresenter presenter: ListOfCitiesViewToPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: Overrides
	
	override var prefersStatusBarHidden: Bool { return true }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureUI()
		presenter.didLoadView()
	}
	
}

fileprivate extension Private_InitialConfiguration {
	
	func configureUI() {
		configureView()
	}
	
	private func configureView() {
		view.backgroundColor = .white
	}
	
	
}

extension ListOfCitiesViewController: ListOfCitiesPresenterToView {}
