//
//  MovieModel.swift
//  seSAC26_assignment
//
//  Created by Sammy Jung on 1/30/24.
//

import Foundation

struct TrendModel: Decodable {
    let page: Int
    let results: [TV]
}

struct TV: Decodable {
    let id: Int
    let name: String
    let original_name: String
    let overview: String
    let average: Double?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case original_name
        case overview
        case average = "vote_average"
        case poster = "poster_path"
    }
}
