// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topic = try? JSONDecoder().decode(Topic.self, from: jsonData)

import Foundation

// MARK: - Topic
struct Topic: Codable {
    let id, slug, title, description: String?
    let publishedAt, updatedAt, startsAt, endsAt: String?
    let visibility: String?
    let featured: Bool?
    let totalPhotos: Int?
    let links: TopicLinks?
    let status: String?
    let owners: [User]?
    let coverPhoto: CoverPhoto?
    let previewPhotos: [PreviewPhoto]?

    enum CodingKeys: String, CodingKey {
        case id, slug, title, description
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case startsAt = "starts_at"
        case endsAt = "ends_at"
        case visibility, featured
        case totalPhotos = "total_photos"
        case links, status, owners
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
    }
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: Urls?
    let links: CoverPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: TopicSubmissions?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case topicSubmissions = "topic_submissions"
        case user
    }
}

// MARK: - CoverPhotoLinks
struct CoverPhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissions: Codable {
    let greenerCities: GreenerCities?
    let architectureInterior: ArchitectureInterior?

    enum CodingKeys: String, CodingKey {
        case greenerCities = "greener-cities"
        case architectureInterior = "architecture-interior"
    }
}

// MARK: - ArchitectureInterior
struct ArchitectureInterior: Codable {
    let status: String?
}

// MARK: - GreenerCities
struct GreenerCities: Codable {
    let status: String?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - User
struct User: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: Social?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct Social: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername, paypalEmail: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
        case paypalEmail = "paypal_email"
    }
}

// MARK: - TopicLinks
struct TopicLinks: Codable {
    let linksSelf, html, photos: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos
    }
}

// MARK: - PreviewPhoto
struct PreviewPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let blurHash: String?
    let urls: Urls?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case blurHash = "blur_hash"
        case urls
    }
}
