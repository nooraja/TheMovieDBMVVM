//
//  Result.swift
//  Testing
//
//  Created by Muhammad Noor on 08/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation

enum Result<T> {

	case success(T)
	case fail(ErrorMessage?)
	
}
