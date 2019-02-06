//
//  HomeController.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import UIKit

class HomeController: BaseViewController {

	
	private lazy var tableView: UITableView = {
		let tv = UITableView()
		tv.translatesAutoresizingMaskIntoConstraints = false
		tv.register(FeatureCell.self, forCellReuseIdentifier: FeatureCell.ReuseId)
		tv.backgroundColor = .clear
		tv.delegate = self
		view.addSubview(tv)
		return tv
	}()
	
	private let viewModel: HomeViewModel!
	
	init(api: ApiService) {
		viewModel = HomeViewModel(apiService: api)
		super.init(nibName: nil, bundle: nil)
		viewModel.delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) { fatalError() }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.registerTableView(tv: tableView)
	}
	
	
	override func setupController() {
		super.setupController()
		title = "Home"
		tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}

}

// MARK: - Table View Delegate
extension HomeController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if deviceType == .pad {
			return 160
		}
		return 130
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let feature = viewModel.grabEarthquakeData(indexPath: indexPath)
		let vc = EarthquakeDescriptionController(feature: feature)
		show(vc, sender: nil)
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		viewModel.checkPagination(indexPath: indexPath)
	}
}


// MARK: - Table View Delegate
extension HomeController: HomeViewModelDelegate {
	
	func showNetworkError() {
		DispatchQueue.main.async {
			self.networkErrorView.isHidden = false
			self.view.bringSubviewToFront(self.networkErrorView)
		}
	}
	
}


