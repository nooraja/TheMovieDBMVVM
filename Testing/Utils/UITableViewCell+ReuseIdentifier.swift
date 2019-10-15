//
//  UITableViewCell+ReuseIdentifier.swift
//  Testing
//
//  Created by Khairil Ushan on 27/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

extension UITableViewCell {

	// MARK: - Public Methods

	static var reuseIdentifier: String {
		return String(describing: self)
	}

	static var nib: UINib {
		return UINib(nibName: reuseIdentifier, bundle: nil)
	}
}
