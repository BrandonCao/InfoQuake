//
//  Codable+Extensions.swift
//  InfoQuake
//
//  Created by Brandon  Cao on 2/4/19.
//  Copyright © 2019 Brandon  Cao. All rights reserved.
//

import Foundation


extension Encodable {
	func toJson() throws -> Data {
		let encoder = JSONEncoder()
		if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
			encoder.dateEncodingStrategy = .iso8601
		}
		return try encoder.encode(self)
	}
}

extension Decodable {
	init(data: Data) throws {
		let decoder = JSONDecoder()
		if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
			decoder.dateDecodingStrategy = .iso8601
		}
		self = try decoder.decode(Self.self, from: data)
	}
}
