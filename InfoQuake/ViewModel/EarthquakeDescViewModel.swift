//
//  EarthquakeDescViewModel.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit

class EarthquakeDescViewModel: NSObject {
	
	private var feature: Feature!
	
	var title: String?
	var place: String?
	var url: String?
	var detail: String?
	
	init(features: Feature) {
		self.feature = features
		super.init()
		configure()
	}
	
	private func configure() {
		let properties = feature.properties
		title = properties.title
		place = properties.place
		url = properties.url
		detail = properties.detail
	}
	
}
