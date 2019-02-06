//
//  BaseViewController.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
	
	var networkErrorView: NetworkErrorView = {
		let v = NetworkErrorView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = .white
		v.isHidden = true
		return v
	}()
	
	var deviceType = UIDevice.current.userInterfaceIdiom
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupController()
	}
	
	
	func setupController() {
		view.backgroundColor = .lightGray
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
		view.addSubview(networkErrorView)
		
		NSLayoutConstraint.activate([
			networkErrorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			networkErrorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			networkErrorView.topAnchor.constraint(equalTo: view.topAnchor),
			networkErrorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
}
