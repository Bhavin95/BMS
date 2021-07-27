//
//  MovieListModel.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/18/21.
//

import Foundation

// MARK: - Movie List Model/ Movie Similar Model

struct MovieListResponseModel: Codable {
    let page: Int?
    let results: [Results]?
    let dates: Dates?
    let totalPages, totalResults: Int?

    public enum CodingKeys: String, CodingKey {
        case page, results, dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page)
        self.results = try container.decodeIfPresent([Results].self, forKey: .results)
        self.dates = try container.decodeIfPresent(Dates.self, forKey: .dates)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - Result
struct Results: Codable {
    let posterPath: String?
    let adult: Bool?
    let overview, releaseDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle: String?
    let originalLanguage: String?
    let title, backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.genreIDS = try container.decodeIfPresent([Int].self, forKey: .genreIDS)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
    }
}
