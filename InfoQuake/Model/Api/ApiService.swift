//
//  ApiService.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit



class ApiService: NSObject {
	
	// Host defaults to getting Earth quaks for the last 30 days
	private let host: String = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&eventtype=earthquake"
	private var session: URLSession = URLSession(configuration: .default)
	private var dataTask: URLSessionDataTask?
	
	func grabDashboardData(limit: Int = 30, offset: Int = 1, callback: @escaping (GeoData?, Error?) -> Void){
		let paginationHost = host + "&limit=\(limit)&offset=\(offset)"
		guard let url = URL(string: paginationHost) else { callback(nil, nil); return }
		makeRequest(with: url, paramaters: [:], httpMethod: .GET) { (data, response, error) in
			if let error = error {
				callback(nil, error)
				return
			}
			let res = response as! HTTPURLResponse
			let statusCode = res.statusCode
			if statusCode == 200 {
				do {
					if let data = data {
						let data = try GeoData(data: data)
						callback(data, nil)
					} else {
						callback(nil, nil)
					}
					
				} catch let error {
					callback(nil, error)
				}
			}
			return
		}
	}
	
	private func makeRequest(with url: URL, paramaters: [String: String], httpMethod: HTTPMethod, callback: @escaping ( Data?, URLResponse?, Error? ) ->() ) {
		dataTask?.cancel()
		do {
			let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
			let headers: [String: String] =  ["Content-Type": "application/json"]
			request.allHTTPHeaderFields =  headers
			request.httpMethod = httpMethod.rawValue
			if paramaters.count > 0 {
				let httpBody = try JSONSerialization.data(withJSONObject: paramaters, options: [])
				request.httpBody = httpBody
			}
			dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: callback)
			dataTask?.resume()
			
		} catch {
			fatalError("couldn't serialize data")
		}
	}
}
