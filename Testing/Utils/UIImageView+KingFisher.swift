//
//  UIImageView+KingFisher.swift
//  Testing
//
//  Created by Muhammad Noor on 28/05/19.
//

import UIKit
import Kingfisher

extension UIImageView {

	// MARK: - Public Methods

	func loadImage(at urlPath: String) {

		guard let url = URL(string: urlPath) else {
			return
		}

		self.kf.setImage(with: url)
	}
}
