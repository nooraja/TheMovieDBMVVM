//
//  MovieDetailViewModel.swift
//  Testing
//
//  Created by NOOR on 10/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MovieDetailViewModel {

	enum Section: Int {
		case header
		case info
	}

	// MARK: - Public Properties

	var reloadDataObservable: Observable<Void> {

		return reloadDataSubject.asObservable()
			.observeOn(MainScheduler.instance)
	}

	var showErrorObservable: Observable<Error> {

		return showErrorSubject.asObservable()
			.observeOn(MainScheduler.instance)
	}

	// MARK: - Private Properties

	private var infoCellViewModels = [MovieDetailInfoCellViewModel]()
	private var headerCellViewModel: MovieDetailHeaderCellViewModel?

	private let networkProvider: MovieNetworkModel?
	private let disposeBag = DisposeBag()
	private let reloadDataSubject = PublishSubject<Void>()
	private let showErrorSubject = PublishSubject<Error>()

	// MARK: - Public Methods

	init(id: Int, networkProvider: MovieNetworkModel = MovieNetworkModel()) {

		self.networkProvider = networkProvider

		self.retrieveMovieDetail(id: id)
	}

	func retrieveMovieDetail(id: Int) {

		networkProvider?.retreiveMovieDetail(id: id).subscribe(onNext: { [weak self] (movieDetail: MovieDetail) in

			self?.createMovieCellViewModel(from: movieDetail)

		}, onError: { [weak self] (error: Error) in
			self?.showErrorSubject.onNext(error)
		})
		.disposed(by: disposeBag)

	}

	func getDetailCellInfoViewModel(atIndex index: Int) -> MovieDetailInfoCellViewModel? {

		guard index < infoCellViewModels.count else {
			return nil
		}

		return infoCellViewModels[index]
	}

	func getDetailCellHeaderViewModel() -> MovieDetailHeaderCellViewModel? {
		return headerCellViewModel
	}

	func getNumberOfRows(forSection section: Int) -> Int {

		switch Section(rawValue: section) {
		case .some(.header):
			return 1

		case .some(.info):
			return infoCellViewModels.count

		case .none:
			return 0
		}
	}

	// MARK: - Private Methods

	private func createMovieCellViewModel(from data: MovieDetail) {

		var cellViewModels = [MovieDetailInfoCellViewModel]()

		cellViewModels.append(MovieDetailInfoCellViewModel(title: "Synopsis", subtitle: data.overview))
		cellViewModels.append(MovieDetailInfoCellViewModel(title: "Duration", subtitle: "\(data.runtime ?? 0)"))

		if  let detailGenre = data.genres?.compactMap({ $0.name }).joined(separator: ", ") {
			cellViewModels.append(MovieDetailInfoCellViewModel(title: "Genre", subtitle: detailGenre))
		}

		if let detailReleaseDate = data.releaseDate?.toFormatterDate(from: "yyyy-mm-dd", to: "dd MMM YYYY") {
			cellViewModels.append(MovieDetailInfoCellViewModel(title: "Release Date", subtitle: detailReleaseDate))
		}

		if let detailCompanyName = data.productionCompanies?.first?.name {
			cellViewModels.append(MovieDetailInfoCellViewModel(title: "Production Company", subtitle: detailCompanyName))
		}

		let languages = "\(data.spokenLanguages?.first?.name ?? "")"

		cellViewModels.append(contentsOf: [
			MovieDetailInfoCellViewModel(title: "Budget", subtitle: "\(data.budget ?? 0)"),
			MovieDetailInfoCellViewModel(title: "Revenue", subtitle: "\(data.revenue ?? 0)"),
			MovieDetailInfoCellViewModel(title: "Language", subtitle: languages)
		])

		infoCellViewModels = cellViewModels

		headerCellViewModel = MovieDetailHeaderCellViewModel(
			urlPathPoster: data.backdropPath,
			title: data.title
		)

		reloadDataSubject.onNext(())
	}

}
