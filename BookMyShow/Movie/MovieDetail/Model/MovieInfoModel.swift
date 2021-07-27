//
//  MovieInfoModel.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/25/21.
//

import Foundation

// MARK: - Movie Review Model

// MARK: - Reviews
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
