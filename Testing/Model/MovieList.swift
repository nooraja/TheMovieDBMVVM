//
//  MovieResultEntity.swift
//  Testing
//
//  Created by Muhammad Noor on 02/05/19.
//  Copyright © 2019 Muhammad Noor. All rights reserved.
//

import Foundation

struct MovieList : Decodable {

	// MARK: - Public Properties
    
    let page : Int?
    let results : [MovieListResult]?
    let totalPages : Int?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
		
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

	subscript(index: Int) -> MovieListResult? {
		return results?[index]
	}
    
}

struct MovieListResult : Codable {

	// MARK: - Public Properties

    let id : Int?
    let originalTitle : String?
    let overview : String?
    let posterPath : String?
    let releaseDate : String?
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
    
}
