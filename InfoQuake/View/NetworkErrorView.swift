//
//  NetworkErrorView.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/5/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit

class NetworkErrorView: UIView {
	
	private lazy var mainLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.text = "No Internet Connection"
		l.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
		l.textAlignment = .center
		return l
	}()
	
	private lazy var descLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.font = UIFont.systemFont(ofSize: 15.0)
		l.lineBreakMode = .byWordWrapping
		l.text = "Make sure your device is connected to the internet."
		l.textAlignment = .center
		return l
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView(){
		addSubview(mainLabel)
		addSubview(descLabel)
		
		NSLayoutConstraint.activate([
			mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			descLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 15),
			descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
			descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
			
		])
	}
	
}
