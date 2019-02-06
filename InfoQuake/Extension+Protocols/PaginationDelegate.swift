//
//  PaginationDelegate.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/5/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation

protocol PaginationDelegate {
	var currentOffset: Int { get set }
	var limit: Int { get set }
	var shouldStopPaging: Bool { get set }
	var isGettingNextPage: Bool { get set }
	func loadNextPage()
	func calculateIfAnyLeft<T>(array: [T])
}

