//
//  Endpoints.swift
//  Testing
//
//  Created by Muhammad Noor on 11/06/19.
//

import Foundation
import RxSwift

protocol EndpointType {

	// MARK: - Public Properties

	var baseURL: URL { get }
	var path: String { get }
	var parameters: [String: Any] { get }
	var header: [String: Any] { get }
	var method: HTTPMethod { get }
}

extension EndpointType {

	var header: [String: Any] {
		return [:]
	}

	var parameter: [String: Any] {
		return [:]
	}

}

enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
	case delete = "DELETE"
	case put = "PUT"
	case patch = "PATCH"
}
