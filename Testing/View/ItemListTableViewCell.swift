//
//  CustomTableCell.swift
//  Testing
//
//  Created by Muhammad Noor on 02/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

final class ItemListTableViewCell: UITableViewCell {

	// MARK: - Private Properties

	@IBOutlet private weak var imgView: UIImageView!
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var releaseLabel: UILabel!
	@IBOutlet private weak var descriptionLabel: UILabel!

	// MARK: - Public Methods

	func bind(viewModel: MovieListCellViewModel?) {

		imgView.loadImage(at: "https://image.tmdb.org/t/p/w500/\(viewModel?.posterPath ?? "")")
		imgView.clipsToBounds = true
		imgView.contentMode = .scaleAspectFit

		titleLabel.text = viewModel?.title
		releaseLabel.text = viewModel?.releaseDate?.toFormatterDate(from: "yyyy-MM-dd", to: "dd MMM yyy")
		descriptionLabel.text = viewModel?.overView

	}

}
