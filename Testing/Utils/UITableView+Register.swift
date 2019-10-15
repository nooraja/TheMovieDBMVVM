//
//  UITableView+Register.swift
//  Testing
//
//  Created by Khairil Ushan on 27/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

extension UITableView {

	// MARK: - Public Methods

	func register<T: UITableViewCell>(_ type: T.Type) {
		register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
	}
}
