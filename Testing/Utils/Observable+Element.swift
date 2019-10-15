//
//  Observable+Element.swift
//  Testing
//
//  Created by Muhammad Noor on 17/06/19.
//

import Foundation
import RxSwift

extension Observable where Element == Response {

	func map<T: Decodable>(to type: T.Type) -> Observable<T> {
		return self.map{ (response: Response) throws -> T in

			guard let data = response.data, let result = try? JSONDecoder().decode(T.self, from: data) else {
				throw APIError.decodeError
			}

			return result
		}
	}
}

