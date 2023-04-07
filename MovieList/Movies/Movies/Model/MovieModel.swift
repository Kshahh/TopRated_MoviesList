//
//  MovieModel.swift
//  Movies
//
//  Created by Kavya Shah on 3/24/23.
//

// This Struct represents a movie object that can be decoded from JSON using "Decodable" protocol.
// The properties in this struct corresponds to the data that is returned by the TMDB API

struct Movie: Decodable,Identifiable{
    let id: Int         // represent the unique ID for the movie
    let title : String  // represents the title of the movie
    let poster_path: String? // represents the url path for the poster image of the movie. But, not all movies have a poster hence, the property is OPTIONAL
    let overview: String // represents the overview of the movie
    let release_date : String? // represents the release data of the movie
    let vote_average : Double? // represents the rating of the movie
    let backdrop_path: String?
    let vote_count : Int?
    
    
}

struct MovieResponse: Decodable {
    let results: [Movie]
}






