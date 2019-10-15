//
//  MovieListViewModel.swift
//  Testing
//
//  Created by Muhammad Noor on 09/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MovieListViewModel {

	// MARK: - Public Properties

	var reloadDataObservable: Observable<Void> {

		return reloadDataSubject.asObservable()
			.observeOn(MainScheduler.instance)
	}

	// MARK: - Private Properties

	private let reloadDataSubject = PublishSubject<Void>()

	private var movies = [MovieListResult]()
	private var cellViewModels = [MovieListCellViewModel]()

	private let disposeBag = DisposeBag()
	private let networkProvider: MovieNetworkModel

	// MARK: - Public Method

	init(networkProvider: MovieNetworkModel = MovieNetworkModel()) {

		self.networkProvider = networkProvider
		retrieveMovieList()
	}

	func retrieveMovieList() {

		networkProvider.retrieveMovieList().subscribe(onNext: { [weak self] (movieList: [MovieListResult]) in
			guard let self = self else {
				return
			}

			self.movies = movieList

			self.cellViewModels = self.movies.map({ (movie :MovieListResult) -> MovieListCellViewModel in
				return MovieListCellViewModel(movie: movie)!
			})

			self.reloadDataSubject.onNext(())
			}, onError: { (error: Error) in
				print(error.localizedDescription)
		})
		.disposed(by: disposeBag)
	}

	func getMoviesCount() -> Int {
		return cellViewModels.count
	}

	func getCellViewModel(atIndex index: Int) -> MovieListCellViewModel? {

		guard index < cellViewModels.count else {
			return nil
		}

		return cellViewModels[index]
	}

}
