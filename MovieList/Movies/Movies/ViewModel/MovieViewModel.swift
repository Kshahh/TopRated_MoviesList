//
//  MovieViewModel.swift
//  Movies
//
//  Created by Kavya Shah on 3/24/23.
//

import Foundation

class MovieViewModel: ObservableObject{
    @Published var movies = [Movie]()
    
    
    init(){
        fetchTopRatedMovies()
    }
    
    func fetchTopRatedMovies(){
        // Call the TMDB API to fetch the top-rated movie data
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=421853461e98ecfaad4c45acac8f4b6c")
        else
        {
            fatalError("URL not found!")
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error fetching movie data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else{
                print("No data returned from Top Rated Movie API ")
                return
            }
            do {
                // Decode the JSON data into an array of Movie Objects
                let decodeResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    self.movies = decodeResponse.results
                }
            }catch let error {
                print("Error decoding movie data: \(error.localizedDescription)")
            }
            
        }.resume()
    }
}

