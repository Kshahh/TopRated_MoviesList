//
//  MovieDetailView.swift
//  Movies
//
//  Created by user233923 on 3/24/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .top)
        {
            Color.mycolor
                .ignoresSafeArea()
            
            VStack
            {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
                Spacer()
            }.padding()
            
            
            
            VStack( spacing: 10){
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                ScrollView(.vertical, showsIndicators: false){
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing:10){
                            if let poster_path = movie.poster_path
                            {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w154\(poster_path)")){
                                    image in image.resizable()
                                        .aspectRatio(contentMode: .fill )
                                }placeholder: {
                                    Color.gray
                                        .frame(width: 200, height: 300)
                                }.frame(width: 200, height: 300)
                                    .cornerRadius(8)
                                
                            }
                            if let backdrop_path = movie.backdrop_path
                                
                            {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w154\(backdrop_path)")){
                                    image in image.resizable()
                                        .aspectRatio(contentMode: .fill )
                                }placeholder: {
                                    Color.gray
                                        .frame(width: 200, height: 300)
                                }.frame(width: 200, height: 300)
                                    .cornerRadius(8)
                                
                            }
                            if let poster_path = movie.poster_path
                            {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w154\(poster_path)")){
                                    image in image.resizable()
                                        .aspectRatio(contentMode: .fill )
                                }placeholder: {
                                    Color.gray
                                        .frame(width: 200, height: 300)
                                }.frame(width: 200, height: 300)
                                    .cornerRadius(8)
                                
                            }
                            if let backdrop_path = movie.backdrop_path
                                
                            {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w154\(backdrop_path)")){
                                    image in image.resizable()
                                        .aspectRatio( contentMode: .fill)
                                }placeholder: {
                                    Color.gray
                                        .frame(width: 200, height: 300)
                                }.frame(width: 200, height: 300)
                                    .cornerRadius(8)
                                
                            }
                            
                            
                        }// HStack Ends
                        
                    }// CarousalScrollView ends
                    
                    
                    
                    VStack(alignment: .center, spacing: 10){
                        Spacer()
                        Spacer()
                        Text(movie.title)
                            .font(.title)
                            .font(.custom("Alfabetica-Bold",size: 30))
                            .foregroundColor(Color.white)
                        Spacer()
                        
                        Divider()
                            .background(Rectangle().foregroundColor(Color.mycolor2))
                    }
                    
                    HStack(){
                        VStack(alignment:.leading, spacing: 10){
                            
                            Text("Released On: \(movie.release_date ?? "N/A")").font(.custom("Alfabetica", size: 18)).foregroundColor(Color.mycolor2).padding(.leading, 10)
                            
                            
                            Text("View Count: \(String( movie.vote_count ?? 0))" ).font(.custom("Alfabetica", size: 18)).foregroundColor(Color.mycolor2).padding(.leading, 10)
                            
                            if let rating = movie.vote_average {
                                let percentage = (rating * 5 )/10.0
                                
                                HStack {
                                    Text("Ratings:  ").font(.custom("Alfabetica", size: 18)).foregroundColor(Color.mycolor2)
                                    ForEach(0..<Int(percentage), id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color.yellow)
                                    }
                                    if rating - Double(Int(percentage)) >= 0.5 {
                                        Image(systemName: "star.leadinghalf.fill")
                                            .foregroundColor(Color.yellow)
                                    }
                                }.font(.caption).foregroundColor(Color.mycolor2).padding(.leading, 10)
                                
                                
                                
                                Divider()
                                    .background(Rectangle().foregroundColor(Color.white))
                                
                                
                                
                                
                            }  // End of VStack
                            
                            VStack(alignment: .leading , spacing: 3){
                                Text("Plot").font(.custom("Alfabetica-Bold", size: 25)).foregroundColor(Color.white).padding()
                                Text(movie.overview).font(.custom("Alfabetica", size: 18))
                                    .foregroundColor(Color.mycolor2)
                                    .padding()
                                    .lineSpacing(3)
                            }
                            
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}







