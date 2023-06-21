// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let search = try? JSONDecoder().decode(Search.self, from: jsonData)

import Foundation

// MARK: - Photos
struct Photos: Codable {
    let id: String?
//    let slug: String?
//    let createdAt, updatedAt, promotedAt: Date?
//    let width, height: Int?
//    let color, blurHash, description, altDescription: String?
    let urls: Urls?
//    let links: SearchLinks?
    let likes: Int?
//    let likedByUser: Bool?
//    let currentUserCollections: []?
//    let sponsorship: Sponsorship?
//    let topicSubmissions: TopicSubmissions?
    let user: User?
    var isFavorite: Bool?

    enum CodingKeys: String, CodingKey {
        case id
//        case slug
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case promotedAt = "promoted_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case description
//        case altDescription = "alt_description"
        case urls, likes
//        case links
//        case likedByUser = "liked_by_user"
//        case currentUserCollections = "current_user_collections"
//        case sponsorship
//        case topicSubmissions = "topic_submissions"
        case user
        case isFavorite
    }
}

// MARK: - SearchLinks
struct SearchLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
//    let impressionUrls: [JSONAny]?
    let tagline: String?
    let taglineURL: String?
    let sponsor: User?

    enum CodingKeys: String, CodingKey {
//        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
