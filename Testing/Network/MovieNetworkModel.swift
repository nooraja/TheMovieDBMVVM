//
//  MovieNetworkModel.swift
//  Testing
//
//  Created by Muhammad Noor on 07/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation
import RxSwift

final class MovieNetworkModel {

	// MARK: - Private Properties
	private let provider: Provider<MovieEndpoint>

	// MARK: - Public Methods

	init(provider: Provider<MovieEndpoint> = Provider<MovieEndpoint>()) {
		self.provider = provider
	}

	func retrieveMovieList() -> Observable<[MovieListResult]> {

		let decodeData = provider.request(endpoint: .movieList).map(to: MovieList.self).map { (movie: MovieList) -> [MovieListResult] in
			return movie.results ?? []
		}

		return decodeData
	}

	func retreiveMovieDetail(id: Int) ->Observable<MovieDetail> {
		return provider.request(endpoint: .detail(id: id)).map(to: MovieDetail.self)
	}

}
