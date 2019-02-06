//
//  FeatureCell.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation
import UIKit

class FeatureCell: UITableViewCell {
	
	private var feature: Feature!
	
	static let ReuseId = "featureCellId"
	
	private lazy var titleLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.lineBreakMode = .byWordWrapping
		l.numberOfLines = 0
		l.font = Theme.Fonts.cellTitle.font
		return l
	}()
	
	private lazy var dateLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.textColor = Theme.Colors.cellFontColor.color
		l.font = Theme.Fonts.cellDescription.font
		return l
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCell()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	fileprivate func setupCell() {
		selectionStyle = .none
		contentView.addSubview(titleLabel)
		contentView.addSubview(dateLabel)
		NSLayoutConstraint.activate([
				titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
				titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
				dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
				dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)
			])
	}
	
	func configureWithData(_ feature: Feature) {
		self.feature = feature
		titleLabel.text = feature.properties.title
		dateLabel.text = Date.dateFromMilliseconds(feature.properties.time)
	}
	
}
