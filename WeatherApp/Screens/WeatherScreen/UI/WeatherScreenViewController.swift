//
//  WeatherScreenViewController.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 11/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit
import ARSLineProgress


// MARK: Typealiases

fileprivate typealias Actions						= WeatherScreenViewController
fileprivate typealias Private_InitialConfiguration	= WeatherScreenViewController


// MARK: Classes

final class WeatherScreenViewController: UIViewController, ErrorShowable {
	
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
	fileprivate let minTemperatureLabel = UILabel(frame: .zero)
	
	fileprivate let kDayTemperatureLabelPadding: CGFloat = 16
	fileprivate let kDayTemperatureLaeblFontSize: CGFloat = 18
	fileprivate let maxTemperatureLabel = UILabel(frame: .zero)
	
	fileprivate let kWeatherDescriptionLabelFontSize: CGFloat = 14
	fileprivate let kWeatherDescriptionLabelNumberOfLines: Int = 2
	fileprivate let weatherDescriptionLabel = UILabel(frame: .zero)
	
	
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
		configureDayTemperatureLebel()
		configureNightTemperatureLabel()
		configureWeatherDescriptionLabel()
		configureInitialConstraints()
	}
	
	private func configureView() {
		view.backgroundColor = .white
	}
	
	private func configureSettingsButton() {
		settingsButton.setImage(#imageLiteral(resourceName: "SettingsButton"), for: .normal)
		settingsButton.setImage(#imageLiteral(resourceName: "SettingsButton_Highlighted"), for: .highlighted)
		settingsButton.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
		view.addSubview(settingsButton)
	}
	
	private func configureCityLabel() {
		cityLabel.text = ""
		view.addSubview(cityLabel)
	}
	
	private func configureWeatherImageView() {
		view.addSubview(weatherImageView)
	}
	
	private func configureAverageTemperatureLabel() {
		averageTemperatureLabel.text = ""
		averageTemperatureLabel.font = UIFont.systemFont(ofSize: kAverageTemperatureLabelFontSize)
		view.addSubview(averageTemperatureLabel)
	}
	
	private func configureDayTemperatureLebel() {
		maxTemperatureLabel.text = ""
		maxTemperatureLabel.font = UIFont.systemFont(ofSize: kDayTemperatureLaeblFontSize)
		view.addSubview(maxTemperatureLabel)
	}
	
	private func configureNightTemperatureLabel() {
		minTemperatureLabel.text = ""
		minTemperatureLabel.textAlignment = .left
		minTemperatureLabel.font = UIFont.systemFont(ofSize: kNightTemperatureLabelFontSize)
		view.addSubview(minTemperatureLabel)
	}
	
	private func configureWeatherDescriptionLabel() {
		weatherDescriptionLabel.text = ""
		weatherDescriptionLabel.font = UIFont.systemFont(ofSize: kWeatherDescriptionLabelFontSize)
		weatherDescriptionLabel.numberOfLines = kWeatherDescriptionLabelNumberOfLines
		view.addSubview(weatherDescriptionLabel)
	}
	
	private func configureInitialConstraints() {
		settingsButton.ars_activateConstraints([
			settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: kSettingsButtonPadding),
			settingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -kSettingsButtonPadding),
			settingsButton.heightAnchor.constraint(equalToConstant: kSettingsButtonHeight),
			settingsButton.widthAnchor.constraint(equalToConstant: kSettingsButtonHeight)
		])
		
		cityLabel.ars_activateConstraints([
			cityLabel.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: kCityLabelPadding),
			cityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: kCityLabelPadding),
			cityLabel.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: -kCityLabelPadding)
		])
		
		weatherImageView.ars_activateConstraints([
			weatherImageView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: kWeatherImageViewPadding),
			weatherImageView.leftAnchor.constraint(equalTo: cityLabel.leftAnchor),
			weatherImageView.heightAnchor.constraint(equalToConstant: kWeatherImageViewHeight),
			weatherImageView.widthAnchor.constraint(equalToConstant: kWeatherImageViewHeight)
		])
		
		averageTemperatureLabel.ars_activateConstraints([
			averageTemperatureLabel.topAnchor.constraint(equalTo: weatherImageView.topAnchor),
			averageTemperatureLabel.leftAnchor.constraint(equalTo: weatherImageView.rightAnchor, constant: kAverageTemperatureLabelLeftPadding),
			averageTemperatureLabel.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: -kAverageTemperatureLabelRightPadding)
		])
		
		minTemperatureLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
		minTemperatureLabel.ars_activateConstraints([
			minTemperatureLabel.topAnchor.constraint(equalTo: averageTemperatureLabel.bottomAnchor),
			minTemperatureLabel.leftAnchor.constraint(equalTo: averageTemperatureLabel.leftAnchor, constant: kDayTemperatureLabelPadding)
		])
		
		maxTemperatureLabel.ars_activateConstraints([
			maxTemperatureLabel.topAnchor.constraint(equalTo: minTemperatureLabel.topAnchor),
			maxTemperatureLabel.leftAnchor.constraint(equalTo: minTemperatureLabel.rightAnchor, constant: kNightTemperatureLabelPadding),
			maxTemperatureLabel.rightAnchor.constraint(greaterThanOrEqualTo: averageTemperatureLabel.rightAnchor, constant: -kNightTemperatureLabelPadding)
		])
		
		weatherDescriptionLabel.ars_activateConstraints([
			weatherDescriptionLabel.topAnchor.constraint(equalTo: maxTemperatureLabel.bottomAnchor),
			weatherDescriptionLabel.leftAnchor.constraint(equalTo: averageTemperatureLabel.leftAnchor),
			weatherDescriptionLabel.rightAnchor.constraint(equalTo: averageTemperatureLabel.rightAnchor)
		])
	}
	
	
}

extension WeatherScreenViewController: WeatherScreenPresenterToViewInterface {
	
	func showPreloader() {
		ARSLineProgress.ars_showOnView(self.view)
	}
	
	func hidePreloader() {
		ARSLineProgress.hide()
	}
	
	func updateUI(withModel viewModel: WeatherScreenViewModel) {
		cityLabel.text = viewModel.cityName
		averageTemperatureLabel.text = viewModel.averageTemperature
		minTemperatureLabel.text = viewModel.minTemperature
		maxTemperatureLabel.text = viewModel.maxTemperature
		weatherDescriptionLabel.text = viewModel.weatherDescription
	}
	
	
}
