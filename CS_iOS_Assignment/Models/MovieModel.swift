//
//  MovieModel.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

enum MovieModel {
    
    struct MovieModelRes: Codable {
        let page : Int?
        let total_pages : Int?
        let total_results : Int?
        let results : [MovieListModel]?
    }
      
    struct MovieListModel: Codable {
        let backdrop_path : String?
        let id : Int?
        let original_title : String?
        let overview : String?
        let popularity : Double?
        let poster_path : String?
        let release_date : String?
        let title : String?
        let vote_average : Double?
        let vote_count : Int?
        let original_language:  String?
    }
}
