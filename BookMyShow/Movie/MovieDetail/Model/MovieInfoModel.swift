//
//  MovieInfoModel.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/25/21.
//

import Foundation

// MARK: - Movie Detail Model

struct MovieDetailResponseModel: Codable {
    let adult: Bool?
    let belongsToCollection: BelongsToCollection?
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    public enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.belongsToCollection = try container.decodeIfPresent(BelongsToCollection.self, forKey: .belongsToCollection)
        self.budget = try container.decodeIfPresent(Int.self, forKey: .budget)
        self.genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
        self.homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
        self.id = try container.decodeIfPresent(Int.self, forKey: .imdbID)
        self.imdbID = try container.decodeIfPresent(String.self, forKey: .homepage)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.productionCompanies = try container.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies)
        self.productionCountries = try container.decodeIfPresent([ProductionCountry].self, forKey: .productionCountries)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
        self.runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
        self.spokenLanguages = try container.decodeIfPresent([SpokenLanguage].self, forKey: .spokenLanguages)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
    }
}

struct BelongsToCollection: Codable {
    let id: Int?
    let name: String?
    let poster_path: String?
    let backdrop_path: String?
}
// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int?
    let logoPath, name, originCountry: String?

    public enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.originCountry = try container.decodeIfPresent(String.self, forKey: .originCountry)
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String?

    public enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iso3166_1 = try container.decodeIfPresent(String.self, forKey: .iso3166_1)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String?

    public enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.englishName = try container.decodeIfPresent(String.self, forKey: .englishName)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.iso639_1 = try container.decodeIfPresent(String.self, forKey: .iso639_1)
    }
}

// MARK: - Movie Review Model
struct MovieReviewModel: Codable {
    let id, page: Int?
    let results: [MovieReviewResult]?
    let totalPages, totalResults: Int?

    public enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page)
        self.results = try container.decodeIfPresent([MovieReviewResult].self, forKey: .results)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}

// MARK: - Movie Review Result
struct MovieReviewResult: Codable {
    let author: String?
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String?
    let url: String?

    public enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.authorDetails = try container.decodeIfPresent(AuthorDetails.self, forKey: .authorDetails)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)

    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String?
    let avatarPath: String?
    let rating: Int?

    public enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.avatarPath = try container.decodeIfPresent(String.self, forKey: .avatarPath)
        self.rating = try container.decodeIfPresent(Int.self, forKey: .rating)
    }
}

// MARK: - Credits

struct MovieCreditsModel: Codable {
    let id: Int?
    let cast, crew: [Cast]?
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: Department?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String?
    let order: Int?
    let department: Department?
    let job: String?

    public enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.knownForDepartment = try container.decodeIfPresent(Department.self, forKey: .knownForDepartment)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath)
        self.character = try container.decodeIfPresent(String.self, forKey: .character)
        self.creditID = try container.decodeIfPresent(String.self, forKey: .creditID)
        self.job = try container.decodeIfPresent(String.self, forKey: .job)
        self.department = try container.decodeIfPresent(Department.self, forKey: .department)
        self.castID = try container.decodeIfPresent(Int.self, forKey: .castID)
        self.order = try container.decodeIfPresent(Int.self, forKey: .castID)

    }
}

public enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
}
