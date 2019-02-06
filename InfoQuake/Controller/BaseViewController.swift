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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupController()
	}
	
	
	func setupController() {
		view.backgroundColor = .lightGray
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
	}
	
}
