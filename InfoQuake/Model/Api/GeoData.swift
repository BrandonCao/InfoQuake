//
//  GeoData.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation

struct GeoData: Codable {
	let type: String
	let metadata: Metadata
	let features: [Feature]
	let bbox: [Double]
}

struct Feature: Codable {
	let type: String
	let properties: Properties
	let geometry: Geometry
	let id: String
}

struct Geometry: Codable {
	let type: String
	let coordinates: [Double]
}


struct Properties: Codable {
	let mag: Double
	let place: String
	let time, updated, tz: Int
	let url, detail: String
	let felt: Int?
	let cdi, mmi: Double?
	let alert: String?
	let status: String
	let tsunami, sig: Int
	let net, code, ids, sources: String
	let types: String
	let nst: Int?
	let dmin: Double?
	let rms: Double?
	let gap: Double?
	let magType: String
	let type: String
	let title: String
}


struct Metadata: Codable {
	let generated: Int
	let url: String
	let title: String
	let status: Int
	let api: String
	let limit, offset, count: Int?
}
