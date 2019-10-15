//
//  MovieViewController.swift
//  Testing
//
//  Created by NOOR on 02/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit
import RxSwift

final class MovieViewController: UITableViewController {

	// MARK: - Private Properties

	private var viewModel: MovieListViewModel?
	private var errorView: ErrorView?
	private let disposeBag = DisposeBag()

	// MARK: - Public Methods

	convenience init(viewModel: MovieListViewModel) {
		self.init()

		self.viewModel = viewModel
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		configureTableView()
		bindViewModel()
	}

	func bindViewModel() {

		viewModel?.reloadDataObservable
			.subscribe(onNext: { [weak self] in
				self?.tableView.reloadData()
			})
		.disposed(by: disposeBag)
	}

	// MARK: - Private Methods

	private func showError(_ error: (ErrorMessage)) {

		guard let nib = Bundle.main.loadNibNamed("ErrorView", owner: self, options: nil),
			let errorView = nib.first as? ErrorView else {
				return
		}

		errorView.configure(name: error.statusMessage ?? "")
		errorView.onRetryButtonTapped = { [weak self] in

			self?.viewModel?.retrieveMovieList()
		}

		self.tableView.tableFooterView = errorView
	}
	
	private func configureTableView() {

		title = "TheMovieDB"
		tableView.delegate = self
		tableView.dataSource = self
		tableView.estimatedRowHeight = 200
		tableView.tableFooterView = UIView()
		tableView.rowHeight = UITableView.automaticDimension
		view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		
		tableView.register(ItemListTableViewCell.self)
	}

}

extension MovieViewController {

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let count = viewModel?.getMoviesCount() else {
			return 0
		}

		return count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(for: indexPath) as ItemListTableViewCell

		if let data = viewModel?.getCellViewModel(atIndex: indexPath.row) {
			cell.bind(viewModel: data)
		}

		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		guard let movieId = self.viewModel?.getCellViewModel(atIndex: indexPath.row)?.id else {
			return
		}

		let detailViewModel = MovieDetailViewModel(id: movieId)
		let detailViewController = MovieDetailViewController(viewModel: detailViewModel)

		navigationController?.pushViewController(detailViewController, animated: false)
	}

}
