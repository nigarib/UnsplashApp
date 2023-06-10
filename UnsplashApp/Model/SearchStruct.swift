//
//  SearchStruct.swift
//  UnsplashApp
//
//  Created by Nigar on 29.05.23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let search = try? JSONDecoder().decode(Search.self, from: jsonData)

import Foundation

// MARK: - Search
struct Search: Codable {
    let total, totalPages: Int?
    let results: [Photos]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct SearchResult: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: Urls?
    let links: ResultLinks?
    let likes: Int?
    let likedByUser: Bool?
    let sponsorship: String?
//    let topicSubmissions: TopicSubmissions?
//    let user: User?
    let tags: [Tag]?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls
        case links, likes
        case likedByUser = "liked_by_user"
        case sponsorship
//        case topicSubmissions = "topic_submissions"
//        case user
        case tags
    }
}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Tag
struct Tag: Codable {
    let type, title: String?
}
