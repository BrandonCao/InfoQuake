//
//  EarthquakeDescriptionController.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit

class EarthquakeDescriptionController: BaseViewController {
	
	
	private lazy var titleLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.lineBreakMode = .byWordWrapping
		l.numberOfLines = 0
		l.font = UIFont.systemFont(ofSize: 25.0)
		return l
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
		view.addSubview(titleLabel)
		titleLabel.text = viewModel.title
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 15),
			titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 15),
			titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -15),
		])
	}
	
}
