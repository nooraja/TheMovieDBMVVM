//
//  DetailMovieResultEntity.swift
//  Testing
//
//  Created by Muhammad Noor on 02/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation
import UIKit

struct MovieDetail : Decodable {

	struct SpokenLanguage : Codable {

		// MARK: - Public Properties

		let name : String?

		enum CodingKeys: String, CodingKey {
			case name = "name"
		}

	}

	struct ProductionCompany : Codable {

		// MARK: - Public Properties

		let id : Int?
		let name : String?

		enum CodingKeys: String, CodingKey {

			case id = "id"
			case name = "name"
		}

	}

	struct DetailGenre : Codable {

		// MARK: - Public Properties

		let id : Int?
		let name : String?

		enum CodingKeys: String, CodingKey {

			case id = "id"
			case name = "name"
		}

	}

	struct ProductionCountry : Codable {

		// MARK: - Public Properties

		let iso31661 : String?
		let name : String?

		enum CodingKeys: String, CodingKey {
			case iso31661 = "iso_3166_1"
			case name = "name"
		}

	}

	// MARK: - Public Properties

    let backdropPath : String?
    let budget : Int?
    let genres : [DetailGenre]?
    let id : Int?
    let originalTitle : String?
    let overview : String?
    let posterPath : String?
    let productionCompanies : [ProductionCompany]?
    let releaseDate : String?
    let revenue : Int?
    let runtime : Int?
    let spokenLanguages : [SpokenLanguage]?
    let title : String?
    
    enum CodingKeys: String, CodingKey {

        case backdropPath = "backdrop_path"
        case budget = "budget"
        case genres = "genres"
        case id = "id"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case title = "title"
    }
    
}
