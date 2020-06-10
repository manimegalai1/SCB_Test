//
//  MovieDetail.swift
//  SCBTest
//
//  Created by Mani Megalai on 9/6/20.
//  Copyright © 2020 Mani Megalai. All rights reserved.
//

import Foundation

class MovieDetail: Codable {
    let Title: String
    let Year: String
    let Rated: String
    let Released: String
    let Runtime: String
    let Genre: String
    let Director: String
    let Writer: String
    let Actors: String
    let Plot: String
    let Poster: String
    let Metascore: String
    let imdbRating: String
    let imdbVotes: String
    let imdbID: String
    let DVD: String
    let BoxOffice: String
    let Production: String
    let Website: String
    let Response: String
    
    init(title: String, year: String, rated: String, release: String, runtime: String, genre: String, director: String, writer: String, actors: String, plot: String, poster: String, metaScore: String, imgRate: String, imgVote: String, imgId: String, dvd: String, boxOffice: String, production: String, website: String, response: String) {
        self.Title = title
        self.Year = year
        self.Rated = rated
        self.Released = release
        self.Runtime = runtime
        self.Genre = genre
        self.Director = director
        self.Writer = writer
        self.Actors = actors
        self.Plot = plot
        self.Poster = poster
        self.Metascore = metaScore
        self.imdbRating = imgRate
        self.imdbVotes = imgVote
        self.imdbID = imgId
        self.DVD = dvd
        self.BoxOffice = boxOffice
        self.Production = production
        self.Website = website
        self.Response = response
    }
}
    
    

