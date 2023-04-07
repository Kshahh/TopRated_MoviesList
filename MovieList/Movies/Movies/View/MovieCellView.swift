//
//  MovieCellView.swift
//  Movies
//
//  Created by user233923 on 3/25/23.
//

import SwiftUI

struct MovieCellView: View {
    var movie : Movie
    var body: some View {
        HStack(alignment: .top, spacing: 4){
            if let poster_path = movie.poster_path
            {
                AsyncImage(url:URL(string: "https://image.tmdb.org/t/p/w154/\(poster_path)")){
                    image in image.resizable()
                        .aspectRatio(contentMode: .fill)
                }placeholder: {
                    Color.gray
                        .frame(width:70, height: 95)
                }.frame (width:70 , height: 95)
                    .cornerRadius(6)
            }
            
          Spacer()
                
            VStack(alignment: .leading, spacing: 5){
                
                HStack{
                    Text(movie.title).font(.headline)
                    
                }
                
                
                if let rating = movie.vote_average {
                    let percentage = (rating * 5 )/10.0
                    HStack {
                        Text("Rating: \(percentage, specifier: "%.1f")")
                        ForEach(0..<1, id: \.self){
                            index in
                            
                            Image(systemName:  "star.fill" )
                                .foregroundColor(.yellow)
                            
                           
                        }
                    }.font(.caption)
              
                Text(movie.overview).font(.caption).foregroundColor(.secondary).lineLimit(2)
                
                
                
                }
                
            }
           
        }
        
        
        }
    
}



