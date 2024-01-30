//
//  MovieModel.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import Foundation

struct TrendModel: Decodable {
    let page: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let original_title: String
    let overview: String
    let backdrop: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case original_title
        case overview
        case backdrop = "backdrop_path"
        case poster = "poster_path"
    }
}
