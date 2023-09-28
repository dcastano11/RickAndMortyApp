//
//  models.swift
//  RickAndMortyApp
//
//  Created by ANRA on 25/09/23.
//

import Foundation

struct Character: Codable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable, Hashable{
    let name: String
    let url: String
}

struct RickAndMortyResponse: Codable, Hashable {
    let info: Info
    let results: [Character]
}

struct Info: Codable, Hashable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct EpisodeResponse: Codable, Hashable {
    let id: Int
    let name: String?
    let air_date: String?
    let episode: String?
}


