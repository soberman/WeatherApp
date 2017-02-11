//
//  WeatherScreenViewController.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit


// MARK: Typealiases

fileprivate typealias Actions						= WeatherScreenViewController
fileprivate typealias Private_InitialConfiguration	= WeatherScreenViewController


// MARK: Classes

final class WeatherScreenViewController: UIViewController {
	
	fileprivate let presenter: WeatherScreenViewToPresenterInterface
	
	fileprivate let kSettingsButtonHeight: CGFloat = 20
	fileprivate let kSettingsButtonPadding: CGFloat = 16
	fileprivate let settingsButton = UIButton(frame: .zero)
	
	
	// MARK: Lifecycle
	
	init(withPresenter presenter: WeatherScreenViewToPresenterInterface) {
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

fileprivate extension Actions {
	
	@objc func didTapSettingsButton() {
		presenter.didTapSettingsButton()
	}
	
	
}

fileprivate extension Private_InitialConfiguration {
	
	func configureUI() {
		configureView()
		configureSettingsButton()
	}
	
	private func configureView() {
		view.backgroundColor = .white
	}
	
	private func configureSettingsButton() {
		settingsButton.setImage(#imageLiteral(resourceName: "SettingsButton"), for: .normal)
		settingsButton.setImage(#imageLiteral(resourceName: "SettingsButton_Highlighted"), for: .highlighted)
		settingsButton.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
		view.addSubview(settingsButton)
		
		settingsButton.ars_activateConstraints([
			settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: kSettingsButtonPadding),
			settingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -kSettingsButtonPadding),
			settingsButton.heightAnchor.constraint(equalToConstant: kSettingsButtonHeight),
			settingsButton.widthAnchor.constraint(equalToConstant: kSettingsButtonHeight)
		])
	}
	
}

extension WeatherScreenViewController: WeatherScreenPresenterToViewInterface {
	
}
