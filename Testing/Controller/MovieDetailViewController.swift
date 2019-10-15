//
//  MovieDetailViewController.swift
//  Testing
//
//  Created by Muhammad Noor on 02/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class MovieDetailViewController: UITableViewController {

	// MARK: - Private Properties

	private var viewModel: MovieDetailViewModel?
	private let disposeBag = DisposeBag()

	// MARK: - Public Methods

	convenience init(viewModel: MovieDetailViewModel) {
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

		viewModel?.showErrorObservable
			.subscribe(onNext: { [weak self] (error: Error) in
				self?.showError(message: error.localizedDescription)
			})
			.disposed(by: disposeBag)
	}

	// MARK: - Private Methods

	private func updateMovieDetail() {

		tableView.reloadData()
		tableView.tableFooterView = UIView()
	}

	private func showError(message: String) {

		guard let nib = Bundle.main.loadNibNamed("ErrorView", owner: self, options: nil),
			let errorView = nib.first as? ErrorView else {
				return
		}

		errorView.configure(name: message)

		tableView.tableFooterView = errorView
	}

	private func configureTableView() {

		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.estimatedRowHeight = 400
		tableView.rowHeight = UITableView.automaticDimension
		tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

		tableView.register(DetailHeaderTableViewCell.self)
		tableView.register(DetailMovieTableViewCell.self)
	}

	private func createHeaderCell(for indexPath: IndexPath) -> DetailHeaderTableViewCell {

		let cell =  tableView.dequeueReusableCell(for: indexPath) as DetailHeaderTableViewCell

		if let data = viewModel?.getDetailCellHeaderViewModel() {
			cell.bind(viewModel: data)
		}

		return cell
	}

	private func createInfoCell(for indexPath: IndexPath) -> DetailMovieTableViewCell {

		let cell =  tableView.dequeueReusableCell(for: indexPath) as DetailMovieTableViewCell

		if let data = viewModel?.getDetailCellInfoViewModel(atIndex: indexPath.row){
			cell.bind(title: data.title ?? "", subtitle: data.subtitle ?? "")
		}

		return cell
	}

}

extension MovieDetailViewController {

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		guard let count = viewModel?.getNumberOfRows(forSection: section) else {
			return 0
		}

		return count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		switch MovieDetailViewModel.Section(rawValue: indexPath.section) {
		case .some(.header):
			return createHeaderCell(for: indexPath)

		case .some(.info):
			return createInfoCell(for: indexPath)

		case .none:
			return UITableViewCell()
		}
	}
	
}
