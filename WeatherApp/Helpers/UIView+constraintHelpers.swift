//
//  UILayoutAnchor+Helpers.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit

extension UIView {
	
	func ars_stickAllEdges(to object: UIView, margin: CGFloat = 0) {
		self.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.leftAnchor.constraint(equalTo: object.leftAnchor, constant: margin),
			self.topAnchor.constraint(equalTo: object.topAnchor, constant: margin),
			self.rightAnchor.constraint(equalTo: object.rightAnchor, constant: -margin),
			self.bottomAnchor.constraint(equalTo: object.bottomAnchor, constant: -margin)
		])
	}
	
	func ars_activateConstraints(_ constraints: [NSLayoutConstraint]) {
		self.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(constraints)
	}
	
	
}
