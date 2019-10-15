//
//  MovieEndpoint.swift
//  Testing
//
//  Created by Muhammad Noor on 17/06/19.
//

import Foundation

enum MovieEndpoint {
	case movieList
	case detail(id: Int)
}

extension MovieEndpoint: EndpointType {

	var baseURL: URL {
		return URL(string: "https://api.themoviedb.org")!
	}

	var path: String {
		switch self {
		case .movieList:
			return "/3/discover/movie"

		case .detail(let id):
			return "/3/movie/\(id)"
		}
	}

	var parameters: [String : Any] {
		switch self {
		case .movieList, .detail:
			return [
				"api_key": "14bc774791d9d20b3a138bb6e26e2579"
			]
		}
	}

	var method: HTTPMethod {
		switch self {
		case .movieList, .detail:
			return .get
		}
	}
	
}
