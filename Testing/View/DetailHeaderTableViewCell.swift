//
//  DetailHeaderTableViewCell.swift
//  Testing
//
//  Created by Muhammad Noor on 03/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

final class DetailHeaderTableViewCell: UITableViewCell {

	// MARK: - Private Properties
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

	// MARK: - Public Methods

    func bind(viewModel: MovieDetailHeaderCellViewModel) {
		
		imgView.loadImage(at: "https://image.tmdb.org/t/p/w500/\(viewModel.urlPathPoster ?? "")")
		imgView.clipsToBounds = true
		imgView.contentMode = .scaleToFill

		titleLabel.text = viewModel.title
	}
    
}
