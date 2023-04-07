import SwiftUI

struct MovieListView: View{
    
    @ObservedObject var viewModel = MovieViewModel()
    var body: some View {
        
        NavigationView{
            
            List(){
                ForEach(viewModel.movies, id: \.id){
                    movie in NavigationLink(destination: MovieDetailView(movie: movie))
                    {
                        MovieCellView(movie: movie)
                        
                        
                    }
                    
                }.onDelete(perform: {indexSet in viewModel.movies.remove(atOffsets: indexSet) })
            }.navigationTitle("Top-Rated Movies")
            
        }
        
    }
    
}
