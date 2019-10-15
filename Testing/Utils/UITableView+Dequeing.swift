//
//  UITableView+Dequeing.swift
//  Testing
//
//  Created by Khairil Ushan on 27/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

extension UITableView {

	// MARK: - Public Methods

	func dequeueReusableCell<T: UITableViewCell>(for indexPath:  IndexPath) -> T {

		guard let cell =  dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Failed to dequeu cell \(T.reuseIdentifier)")
		}

		return cell
	}
}
