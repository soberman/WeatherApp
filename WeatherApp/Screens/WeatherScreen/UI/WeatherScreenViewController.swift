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
	
	fileprivate let kCityLabelPadding: CGFloat = 16
	fileprivate let cityLabel = UILabel(frame: .zero)
	
	fileprivate let kWeatherImageViewPadding: CGFloat = 16
	fileprivate let kWeatherImageViewHeight: CGFloat = 100
	fileprivate let weatherImageView = UIImageView(frame: .zero)
	
	fileprivate let kAverageTemperatureLabelFontSize: CGFloat = 64
	fileprivate let kAverageTemperatureLabelRightPadding: CGFloat = 16
	fileprivate let kAverageTemperatureLabelLeftPadding: CGFloat = 48
	fileprivate let averageTemperatureLabel = UILabel(frame: .zero)
	
	fileprivate let kNightTemperatureLabelPadding: CGFloat = 16
	fileprivate let kNightTemperatureLabelFontSize: CGFloat = 18
	fileprivate let nightTemperatureLabel = UILabel(frame: .zero)
	
	fileprivate let kDayTemperatureLabelPadding: CGFloat = 16
	fileprivate let kDayTemperatureLaeblFontSize: CGFloat = 18
	fileprivate let dayTemperatureLabel = UILabel(frame: .zero)
	
	
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
		configureCityLabel()
		configureWeatherImageView()
		configureAverageTemperatureLabel()
		configureNightTemperatureLabel()
		configureDayTemperatureLebel()
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
	
	private func configureCityLabel() {
		// TODO: remove this during loading state implementation
		cityLabel.text = "Change this text during loading state implementation"
		view.addSubview(cityLabel)
		
		cityLabel.ars_activateConstraints([
			cityLabel.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: kCityLabelPadding),
			cityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: kCityLabelPadding),
			cityLabel.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: -kCityLabelPadding)
		])
	}
	
	private func configureWeatherImageView() {
		// TODO: remove this during loading state implementation
		weatherImageView.backgroundColor = .purple
		view.addSubview(weatherImageView)
		
		weatherImageView.ars_activateConstraints([
			weatherImageView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: kWeatherImageViewPadding),
			weatherImageView.leftAnchor.constraint(equalTo: cityLabel.leftAnchor),
			weatherImageView.heightAnchor.constraint(equalToConstant: kWeatherImageViewHeight),
			weatherImageView.widthAnchor.constraint(equalToConstant: kWeatherImageViewHeight)
		])
	}
	
	private func configureAverageTemperatureLabel() {
		// TODO: remove this during loading state implementation
		averageTemperatureLabel.text = "+15°"
		averageTemperatureLabel.font = UIFont.systemFont(ofSize: kAverageTemperatureLabelFontSize)
		view.addSubview(averageTemperatureLabel)
		
		averageTemperatureLabel.ars_activateConstraints([
			averageTemperatureLabel.topAnchor.constraint(equalTo: weatherImageView.topAnchor),
			averageTemperatureLabel.leftAnchor.constraint(equalTo: weatherImageView.rightAnchor, constant: kAverageTemperatureLabelLeftPadding),
			averageTemperatureLabel.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: -kAverageTemperatureLabelRightPadding)
		])
	}
	
	private func configureNightTemperatureLabel() {
		// TODO: remove this during loading state implementation
		nightTemperatureLabel.text = "+8°"
		nightTemperatureLabel.font = UIFont.systemFont(ofSize: kNightTemperatureLabelFontSize)
		view.addSubview(nightTemperatureLabel)
		
		nightTemperatureLabel.ars_activateConstraints([
			nightTemperatureLabel.topAnchor.constraint(equalTo: averageTemperatureLabel.bottomAnchor),
			nightTemperatureLabel.rightAnchor.constraint(equalTo: averageTemperatureLabel.rightAnchor, constant: -kNightTemperatureLabelPadding)
		])
	}
	
	private func configureDayTemperatureLebel() {
		// TODO: remove this during loading state implementation
		dayTemperatureLabel.text = "+18°"
		dayTemperatureLabel.font = UIFont.systemFont(ofSize: kDayTemperatureLaeblFontSize)
		view.addSubview(dayTemperatureLabel)
		
		dayTemperatureLabel.ars_activateConstraints([
			dayTemperatureLabel.topAnchor.constraint(equalTo: nightTemperatureLabel.topAnchor),
			dayTemperatureLabel.rightAnchor.constraint(equalTo: nightTemperatureLabel.leftAnchor, constant: -kDayTemperatureLabelPadding)
		])
	}
	
}

extension WeatherScreenViewController: WeatherScreenPresenterToViewInterface {
	
}
