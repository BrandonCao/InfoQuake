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
	var time: String?
	var url: URL?
	var magnitude: String?
	
	init(features: Feature) {
		self.feature = features
		super.init()
		configure()
	}
	
	private func configure() {
		let properties = feature.properties
		title = properties.title
		time = "Time of event:\n" + Date.dateFromMilliseconds(feature.properties.time)
		url = URL(string: properties.url)
		magnitude = "Magnitude:\n\(properties.mag)"
	}
	
}
