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
		l.font = UIFont.systemFont(ofSize: 25.0, weight: .medium)
		return l
	}()
	
	private lazy var timeLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.lineBreakMode = .byWordWrapping
		l.numberOfLines = 0
		l.font = UIFont.systemFont(ofSize: 20.0)
		return l
	}()
	
	private lazy var magLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.lineBreakMode = .byWordWrapping
		l.numberOfLines = 0
		l.font = UIFont.systemFont(ofSize: 20.0)
		return l
	}()
	
	private lazy var moreInfoLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.lineBreakMode = .byWordWrapping
		l.numberOfLines = 0
		l.text = "For more info about the event:"
		l.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
		return l
	}()
	
	private lazy var urlButton: UIButton = {
		let b = UIButton()
		b.translatesAutoresizingMaskIntoConstraints = false
		b.setTitleColor(.blue, for: .normal)
		b.setTitle("Click Here", for: .normal)
		b.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
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
		view.backgroundColor = .white
		view.addSubview(scrollView)
		
		// constrain the scroll view to 8-pts on each side
		scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
		scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8.0).isActive = true
		
		scrollView.addSubview(titleLabel)
		scrollView.addSubview(timeLabel)
		scrollView.addSubview(magLabel)
		scrollView.addSubview(moreInfoLabel)
		scrollView.addSubview(urlButton)
		

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
			titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),
			titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -leadingAnchorConst),
			timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 45),
			timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),
			
			magLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 45),
			magLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),
			magLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -leadingAnchorConst),

			moreInfoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),
			moreInfoLabel.topAnchor.constraint(equalTo: magLabel.bottomAnchor, constant: 200),
			moreInfoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -leadingAnchorConst),

			urlButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAnchorConst),
			urlButton.topAnchor.constraint(equalTo: moreInfoLabel.bottomAnchor, constant: 5),
			urlButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15),


		])		
		titleLabel.text = viewModel.title
		timeLabel.text = viewModel.time
		magLabel.text = viewModel.magnitude
	}
	
	@objc
	private func openEventUrl() {
		let safariVC = SFSafariViewController(url: viewModel.url!)
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
