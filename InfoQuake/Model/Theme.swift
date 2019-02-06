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
		case title
		case infoLabel
		case moreInfoLabel
		case urlButton
		
		var font: UIFont {
			switch self {
			case .cellTitle:
				if UIDevice.current.userInterfaceIdiom == .pad {
					return UIFont.systemFont(ofSize: 25.0, weight: .medium)
				}
				return UIFont.systemFont(ofSize: 17.0, weight: .medium)
			case .cellDescription:
				if UIDevice.current.userInterfaceIdiom == .pad {
					return UIFont.systemFont(ofSize: 20.0)
				}
				return UIFont.systemFont(ofSize: 15.0)
			case .title:
				if UIDevice.current.userInterfaceIdiom == .pad {
					return UIFont.systemFont(ofSize: 35.0, weight: .medium)
				}
				return UIFont.systemFont(ofSize: 25.0, weight: .medium)
			case .infoLabel:
				if UIDevice.current.userInterfaceIdiom == .pad {
					return UIFont.systemFont(ofSize: 30.0)
				}
				return UIFont.systemFont(ofSize: 20.0)
				
			case .moreInfoLabel:
				if UIDevice.current.userInterfaceIdiom == .pad {
					return UIFont.systemFont(ofSize: 30.0, weight: .medium)
				}
				return UIFont.systemFont(ofSize: 20.0, weight: .medium)
			case .urlButton:
				if UIDevice.current.userInterfaceIdiom == .pad {
					return UIFont.systemFont(ofSize: 20.0)
				}
				return UIFont.systemFont(ofSize: 15.0)
			}
		}
		
	}
	
}
