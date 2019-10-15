//
//  DetailMovieTableViewCell.swift
//  Testing
//
//  Created by Muhammad Noor on 03/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

final class DetailMovieTableViewCell: UITableViewCell {

	// MARK: - Private Properties

	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var descriptionLabel: UILabel!

	// MARK: - Public Methods

	func bind(title: String, subtitle: String) {

		titleLabel.text = title
		descriptionLabel.text = subtitle
	}
}
