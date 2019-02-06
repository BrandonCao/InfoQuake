//
//  Date+Extensions.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit


extension Date {
	
	static func dateFromMilliseconds(_ ms: Int) -> String {
		let dateVar = Date(timeIntervalSince1970: (Double(ms) / 1000.0))
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMM d, yyyy \t h:mm a"
		return dateFormatter.string(from: dateVar)
	}
	
}
