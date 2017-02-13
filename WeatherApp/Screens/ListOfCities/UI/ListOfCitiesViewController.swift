//
//  ListOfCitiesViewController.swift
//  WeatherApp
//
//  Created by Yaroslav Arsenkin on 12/02/2017.
//  Copyright © 2017 Yarik Arsenkin. All rights reserved.
//

import Foundation


// MARK: Typealiases

fileprivate typealias Private_InitialConfiguration	= ListOfCitiesViewController
fileprivate typealias Private_Helpers				= ListOfCitiesViewController


// MARK: Classes

final class ListOfCitiesViewController: UIViewController {
	
	fileprivate let presenter: ListOfCitiesViewToPresenter
	
	fileprivate let kCollectionViewCellHeight: CGFloat = 40
	fileprivate let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ListOfCitiesViewController.configuredCollectionViewLayout())
	fileprivate var maybeViewModel: ListOfCitiesViewModel?
	
	
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
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		
		collectionView.collectionViewLayout.invalidateLayout()
	}
	
}

fileprivate extension Private_InitialConfiguration {
	
	func configureUI() {
		configureView()
		configureCollectionView()
		configureInitialConstraints()
	}
	
	private func configureView() {
		title = "List of Cities"
		view.backgroundColor = .white
	}
	
	private func configureCollectionView() {
		collectionView.backgroundColor = .white
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(ListOfCitiesCell.self, forCellWithReuseIdentifier: String(describing: ListOfCitiesCell.self))
		view.addSubview(collectionView)
	}
	
	private func configureInitialConstraints() {
		collectionView.ars_stickAllEdges(to: view)
	}
	
	
}

fileprivate extension Private_Helpers {
	
	static func configuredCollectionViewLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 0
		
		return layout
	}
	
	
}

extension ListOfCitiesViewController: ListOfCitiesPresenterToView {

	func updateUI(withModel viewModel: ListOfCitiesViewModel) {
		maybeViewModel = viewModel
		collectionView.reloadData()
	}
	

}

extension ListOfCitiesViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return maybeViewModel?.numberOfCells ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ListOfCitiesCell.self),
		                                              for: indexPath)
		guard let cityCell = cell as? ListOfCitiesCell, let viewModel = maybeViewModel else {
			return cell
		}
		
		cityCell.configure(withViewModel: viewModel.cellViewModels[indexPath.row])
		
		return cityCell
	}
	
	
}

extension ListOfCitiesViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width, height: kCollectionViewCellHeight)
	}
	
	
}

extension ListOfCitiesViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let selectedCityName = maybeViewModel?.cellViewModels[indexPath.row].cityName else { return }
		presenter.didSelectCity(withName: selectedCityName)
	}
	
	
}
