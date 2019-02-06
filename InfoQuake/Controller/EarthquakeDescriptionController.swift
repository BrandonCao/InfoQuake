//
//  EarthquakeDescriptionController.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class EarthquakeDescriptionController: BaseViewController {
	private let leadingAnchorConst: CGFloat = 15.0
	
	private lazy var scrollView: UIScrollView = {
		let v = UIScrollView()
		v.translatesAutoresizingMaskIntoConstraints = false
		return v
	}()
	
	private lazy var titleLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.lineBreakMode = .byWordWrapping
		l.numberOfLines = 0
		l.font = UIFont.systemFont(ofSize: 25.0)
		return l
	}()
	
	private lazy var placeLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.lineBreakMode = .byWordWrapping
		l.numberOfLines = 0
		l.font = UIFont.systemFont(ofSize: 20.0)
		return l
	}()
	
	private lazy var urlButton: UIButton = {
		let b = UIButton()
		b.translatesAutoresizingMaskIntoConstraints = false
		b.setTitleColor(.blue, for: .normal)
		b.setTitle("Link to event", for: .normal)
		b.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
		b.addTarget(self, action: #selector(openEventUrl), for: .touchUpInside)
		return b
	}()
	

	private var viewModel: EarthquakeDescViewModel!
	
	init(feature: Feature) {
		viewModel = EarthquakeDescViewModel(features: feature)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func setupController() {
		super.setupController()
		title = "Earthquake Details"
		view.addSubview(scrollView)
		
		// constrain the scroll view to 8-pts on each side
		scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
		scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8.0).isActive = true
		
		scrollView.addSubview(titleLabel)
		scrollView.addSubview(placeLabel)
		scrollView.addSubview(urlButton)
		

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
			titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),
			titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -leadingAnchorConst),
			placeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 45),
			placeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),

			urlButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),
			urlButton.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 200),
			urlButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15),


		])
		
		
		titleLabel.text = viewModel.title
		placeLabel.text = viewModel.place
		
	}
	
	@objc
	private func openEventUrl() {
		let safariVC = SFSafariViewController(url: URL(string: viewModel.url!)!)
		safariVC.delegate = self
		present(safariVC, animated: true, completion: nil)
	}
	
}

// MARK: - Safari View Controller Delegate
extension EarthquakeDescriptionController: SFSafariViewControllerDelegate {

	
	func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
		controller.dismiss(animated: true, completion: nil)
	}
	
}
