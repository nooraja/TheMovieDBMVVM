//
//  ErrorMessage.swift
//  Testing
//
//  Created by Muhammad Noor on 23/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation

struct ErrorMessage: Decodable {

	// MARK: - Public Properties
	
	let statusCode: Int?
	let statusMessage: String?

	enum CodingKeys: String, CodingKey {
		case statusCode = "status_code"
		case statusMessage = "status_message"
	}

}
