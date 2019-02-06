//
//  Theme.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit


class Theme: NSObject {
	
	// MARK: - Colors
	enum Colors {
		case cellFontColor
		
		var color: UIColor {
			switch self {
			case .cellFontColor:
				return UIColor.black
			}
		}
	}

	// MARK: - Fonts
	enum Fonts {
		case cellTitle
		case cellDescription
		
		var font: UIFont {
			switch self {
			case .cellTitle:
				return UIFont.systemFont(ofSize: 17.0, weight: .medium)
			case .cellDescription:
				return UIFont.systemFont(ofSize: 15.0)
			}
		}
		
	}
	
}
