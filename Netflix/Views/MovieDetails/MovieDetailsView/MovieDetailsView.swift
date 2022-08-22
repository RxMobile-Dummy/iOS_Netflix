//
//  MovieDetailsView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import SwiftUI
import Kingfisher

//MARK: - MovieDetails View
struct MovieDetailsView: View {

  /// movie object of MovieModel
  let movie: MovieModel

  /// moviesVM object of MoviesVM
  @EnvironmentObject var moviesVM:MoviesVM
  /// authVM object of AuthVM
  @EnvironmentObject var authVM: AuthVM

  /// isShowingVideo object of Bool
  @State private var isShowingVideo = false
  
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(.all)
      ScrollView(.vertical, showsIndicators: false) {
        KFImage.url(URL(string: movie.imageUrl))
          .resizable()
          .scaledToFill()
          .clipped()
        
        VStack(alignment: .leading, spacing: 8) {
          Text(movie.name)
            .font(.title)
          HStack {
            Text(movie.releaseYear())
            Text(movie.ageRestriction)
            Spacer()
            if(movie.id == "62fe098ae81134f4b4bc") {
              NavigationLink(destination: VideoView(), isActive: $isShowingVideo) { EmptyView() }
              Button {
                self.isShowingVideo = true
              } label: {
                Text(kVIDEO)
              }
              .frame(width: 80, height: 30)
              .foregroundColor(.white)
              .background(.green)
              .cornerRadius(4)
            }
          }
          Text(movie.description)
        }.padding()
        
        HStack {
          Button {
            Task {
              await self.addToMyList()
            }
          } label: {
            VStack {
              Image(systemName: moviesVM.watchList.contains(movie.id) ? kIMG_CHECKMARK : kIMG_PLUS)
              Text(kMYLIST)
            }
            .padding()
          }
          .foregroundColor(.white)
          .cornerRadius(4)
        }
        .padding(.horizontal)

        if((moviesVM.movies["watchlist"]?.count ?? 0) > 0) {
          VStack(alignment: .leading) {
            Text(kMORE_LIKE_THIS.uppercased())
              .font(.headline)
            MovieGridView(movies: moviesVM.movies["watchlist"] ?? [])
          }.padding(.horizontal)
        }
      }
      .foregroundColor(.white)
    }
    .ignoresSafeArea(.all, edges: .top)
  }

  //MARK: - Add to WatchList Method
  func addToMyList() async -> Void {
    await moviesVM.addToMyList(movie.id)
  }
  
}

//MARK: - Movie Details View Previews
struct MovieDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetailsView(movie: MovieModel(id: "1", name: "Spider Man", durationMinutes: 200, releaseDate: 2000, ageRestriction: "R", thumbnailImageId: "test", description: "Awesome movie", popularityIndex: 12, netflixReleaseDate: 12334, isOriginal: true,
                                       tags: "", genres: "", cast: ""))
  }
}
