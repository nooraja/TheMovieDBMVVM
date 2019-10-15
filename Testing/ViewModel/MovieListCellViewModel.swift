//
//  MovieListCellViewModel.swift
//  Testing
//
//  Created by NOOR on 10/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation

struct MovieListCellViewModel {

	// MARK: - Public Properties
	
	let title: String?
	let posterPath: String?
	let releaseDate: String?
	let overView: String?
	let id: Int?

	init?(movie: MovieListResult) {

		guard let id: Int = movie.id,
			let title: String = movie.originalTitle,
			let posterPath: String = movie.posterPath,
			let releaseDate: String = movie.releaseDate,
			let overView: String = movie.overview else {
				return nil
		}

		self.id = id
		self.title = title
		self.posterPath = posterPath
		self.releaseDate = releaseDate
		self.overView = overView
	}

}
