//
//  NetworkModel.swift
//  Testing
//
//  Created by Muhammad Noor on 06/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import RxSwift
import RxCocoa

struct Response {

	// MARK: - Public Properties

	let data: Data?
	let response: URLResponse?
}

struct Provider<Endpoint: EndpointType> {

	// MARK: - Public Method

	func request(endpoint: Endpoint) -> Observable<Response> {

		var components = URLComponents(url: endpoint.baseURL, resolvingAgainstBaseURL: true)
		components?.path = endpoint.path
		components?.queryItems = endpoint.parameters.map { parameter -> URLQueryItem in
			return URLQueryItem(name: parameter.key, value: String(describing: parameter.value))
		}

		guard let url = components?.url else {
			return Observable.error(APIError.invalidURL)
		}

		var request = URLRequest(url: url)
		request.httpMethod = endpoint.method.rawValue

		return URLSession.shared.rx.response(request: request).map { response, data in
			return Response(data: data, response: response)
		}
	}
}
