//
//  ErrorView.swift
//  Testing
//
//  Created by Muhammad Noor on 22/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import UIKit

final class ErrorView: UIView {

	// MARK: - Private Properties
	
	@IBOutlet weak var titleError: UILabel!
	@IBOutlet weak var retryButton: UIButton!

	// MARK: - Public Properties

	var onRetryButtonTapped: (() -> Void)?

	// MARK: - Public Methods

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func configure(name: String) {
		titleError.text = name
	}

	@IBAction func tappedButtonReconnect(_ sender: Any) {
		onRetryButtonTapped?()
	}

}
