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
	
	
	//Pagination Delegate
	var currentOffset = 1
	var limit = 50
	var shouldStopPaging = false
	var isGettingNextPage = false
	var searchTerm: String = ""

	private var tableView: UITableView!
	
	private var geoData: GeoData? {
		didSet {
			guard let data = geoData else { return }
			featuresArray.append(contentsOf: data.features)
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	private var apiService: ApiService!
	private var featuresArray: [Feature] = []
	
	init(apiService: ApiService) {
		self.apiService = apiService
		super.init()
	}
	
	func registerTableView(tv: UITableView) {
		tv.dataSource = self
		tableView = tv
		grabData()
	}
	
	func grabData() {
		featuresArray.removeAll()
		apiService.grabDashboardData(limit: self.limit, offset: self.currentOffset, callback:  { (data, error) in
			if let error = error {
				print(error)
				return
			}
			
			self.geoData = data
			return
		})
	}
	
	func grabEarthquakeData(indexPath: IndexPath) -> Feature {
		let selectedFeature = featuresArray[indexPath.row]
		return selectedFeature
	}
	
	func checkPagination(indexPath: IndexPath ) {
		if indexPath.row == featuresArray.count - 1 {
			if !shouldStopPaging {
				self.loadNextPage()
			}
		}
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

// MARK: - Pagination Delegate
extension HomeViewModel: PaginationDelegate {
	
	
	func loadNextPage() {
		if shouldStopPaging || isGettingNextPage {
			return
		}
		
		isGettingNextPage = true
		DispatchQueue.global(qos: .background).async {
			self.apiService.grabDashboardData(limit: self.limit, offset: self.currentOffset, callback: { (data, error) in
				if let error = error {
					print(error)
					return
				}
				guard let data = data else { return }
				
				
				if data.features.count > 0 {
					self.featuresArray.append(contentsOf: data.features)
					self.calculateIfAnyLeft(array: data.features)
					self.currentOffset = self.currentOffset + data.features.count
				} else {
					self.shouldStopPaging = true
				}
				
				self.isGettingNextPage = false
				DispatchQueue.main.async {
					self.isGettingNextPage = false
					self.tableView.reloadData()
				}
			})
			
			
		}
	}
	
	func calculateIfAnyLeft<T>(array: [T]) {
		if (array.count < limit) {
			self.shouldStopPaging = true
		}
	}
	
	
}


