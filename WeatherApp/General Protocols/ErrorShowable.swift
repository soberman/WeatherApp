//
//  ErrorShowable.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit

protocol ErrorShowable {
	func showError(errorDescription: String)
	func showError(errorDescription: String, confirmTitle: String, onConfirm: @escaping () -> Void)
}

extension ErrorShowable where Self: UIViewController {
	
	func showError(errorDescription: String) {
		let alert = UIAlertController(title: errorDescription, message: nil, preferredStyle: .alert)
		present(alert, animated: true, completion: nil)
	}
	
	func showError(errorDescription: String, confirmTitle: String, onConfirm: @escaping () -> Void) {
		let alert = UIAlertController(title: errorDescription, message: nil, preferredStyle: .alert)
		let confirmAction = UIAlertAction(title: confirmTitle, style: .default) { _ in
			onConfirm()
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alert.addAction(cancelAction)
		alert.addAction(confirmAction)
		
		present(alert, animated: true, completion: nil)
	}
	
	
}
