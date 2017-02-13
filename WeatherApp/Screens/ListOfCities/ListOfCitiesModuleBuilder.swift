//
//  ListOfCitiesModuleBuilder.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation

final class ListOfCitiesModuleBuilder {
	
	private static weak var maybeNavController: UINavigationController?
	
	private init() {}
	
	class func buildListOfCitiesModule(fromWireframe: WeatherScreenWireframe) -> UIViewController {
		let wireframe = ListOfCitiesWireframe(withReferencedWireframe: fromWireframe)
		let interactor = ListOfCitiesInteractor()
		let presenter = ListOfCitiesPresenter(interactor: interactor, wireframe: wireframe)
		let viewController = ListOfCitiesViewController(withPresenter: presenter)
		
		presenter.setView(viewController)
		
		let navController = UINavigationController(rootViewController: viewController)
		let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissListOfCitiesViewController))
		viewController.navigationItem.leftBarButtonItem = cancel
		maybeNavController = navController
		
		return navController
	}
	
	@objc class func dismissListOfCitiesViewController() {
		maybeNavController?.dismiss(animated: true, completion: nil)
	}
	
	
}
