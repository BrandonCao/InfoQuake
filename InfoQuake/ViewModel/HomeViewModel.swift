//
//  HomeViewModel.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit


class HomeViewModel: NSObject {
	
	private var geoData: GeoData? {
		didSet {
			guard let data = geoData else { return }
			featuresArray.append(contentsOf: data.features)
			print("Count: ")
			print(featuresArray.count)
		}
	}
	private var apiService: ApiService!
	private var featuresArray: [Feature] = []
	
	init(apiService: ApiService) {
		self.apiService = apiService
		super.init()
	}
	
	func grabData(callback: @escaping () -> Void) {
		featuresArray.removeAll()
		apiService.grabDashboardData { (data, error) in
			if let error = error {
				print(error)
				callback()
				return
			}
			
			self.geoData = data
			callback()
		}
	}
	
	func grabEarthquakeData(indexPath: IndexPath) -> Feature {
		let selectedFeature = featuresArray[indexPath.row]
		return selectedFeature
	}
	
}


// MARK: - TableView DataSource 
extension HomeViewModel: UITableViewDataSource {

	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return featuresArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: FeatureCell.ReuseId, for: indexPath) as! FeatureCell
		let feature = featuresArray[indexPath.row]
		cell.configureWithData(feature)
		return cell
	}
	
	
}
