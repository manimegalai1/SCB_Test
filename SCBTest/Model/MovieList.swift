//
//  MovieList.swift
//  SCBTest
//
//  Created by Mani Megalai on 9/6/20.
//  Copyright © 2020 Mani Megalai. All rights reserved.
//

import Foundation

// Class Search

class Search: Codable {
    let Search: [MovieList]
    init(searchData: [MovieList]) {
        self.Search = searchData
    }
}

// Class MovieList

class MovieList: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let Poster: String
    init(title: String, year: String, imgId: String, type: String, poster: String) {
        self.Title = title
        self.Year = year
        self.imdbID = imgId
        self.Poster = poster
    }
}
