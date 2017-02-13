//
//  ListOfCitiesCell.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import UIKit


// MARK: Typealiases

fileprivate typealias AccessibleFromOutside			= ListOfCitiesCell
fileprivate typealias Private_InitialConfiguration	= ListOfCitiesCell


// MARK: Classes

final class ListOfCitiesCell: UICollectionViewCell {
	
	let line = UIView(frame: .zero)
	let titleLabel = UILabel(frame: .zero)

	// MARK: Lifecycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: Overrides
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		titleLabel.text = ""
	}
	
	
}

extension AccessibleFromOutside {
	
	func configure(withViewModel viewModel: ListOfCitiesCellViewModel) {
		titleLabel.text = viewModel.cityName
	}
	
	
}

fileprivate extension Private_InitialConfiguration {
	
	func configureUI() {
		configureView()
		configureLine()
		configureTitleLabel()
		configureInitialConstraints()
	}
	
	private func configureView() {
		contentView.backgroundColor = .white
	}
	
	private func configureLine() {
		line.backgroundColor = .lightGray
		contentView.addSubview(line)
	}
	
	private func configureTitleLabel() {
		titleLabel.textAlignment = .left
		contentView.addSubview(titleLabel)
	}
	
	private func configureInitialConstraints() {
		titleLabel.ars_activateConstraints([
			titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
		
		line.ars_activateConstraints([
			line.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			line.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			line.heightAnchor.constraint(equalToConstant: 1)
		])
	}
	
	
}
