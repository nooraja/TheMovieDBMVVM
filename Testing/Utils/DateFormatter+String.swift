//
//  Extension.swift
//  Testing
//
//  Created by Muhammad Noor on 08/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

extension String {

	// MARK: - Public Methods

	func toFormatterDate(from originalFormatter: String, to finalFormatter: String) -> String {
		
		let mutableDate: DateFormatter = DateFormatter()
		mutableDate.dateFormat = originalFormatter

		let specificDate: Date? = mutableDate.date(from: self)
		mutableDate.dateFormat = finalFormatter
		let resultFormatterDate = mutableDate.string(from: specificDate ?? Date())

		return resultFormatterDate
	}
}
