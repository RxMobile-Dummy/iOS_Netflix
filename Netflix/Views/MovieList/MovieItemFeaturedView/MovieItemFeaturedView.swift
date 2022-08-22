//
//  MovieItemFeaturedView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import SwiftUI
import Kingfisher

//MARK: - MovieItem Featured View
struct MovieItemFeaturedView: View {

  /// isShowingDetailView object of Bool
  @State private var isShowingDetailView = false
  /// movie object of MovieModel
  let movie: MovieModel
  /// isInWatchlist object of Bool
  let isInWatchlist: Bool
  /// onTapMyList call back function
  let onTapMyList: () -> Void
  
  var body: some View {
    ZStack{
      KFImage.url(URL(string: movie.imageUrl))
        .resizable()
        .scaledToFill()
        .clipped()
      VStack {
        Spacer()
        Text(movie.tags)
          .foregroundColor(.white)
        HStack {
          Spacer()
          Button {
            onTapMyList()
          } label: {
            VStack {
              Image(systemName: self.isInWatchlist ? kIMG_CHECKMARK : kIMG_PLUS)
              Text(kMYLIST)
            }
            .padding()
          }
          .foregroundColor(.white)
          .cornerRadius(4)
          /// Navigate to MovieDetails View
          NavigationLink(destination: MovieDetailsView(movie: movie), isActive: $isShowingDetailView) { EmptyView() }
          Button {
            self.isShowingDetailView = true
          } label: {
            VStack {
              Image(systemName: kIMG_INFO_CIRCLE)
              Text(kINFO)
            }
            .padding()
          }
          .foregroundColor(.white)
          .cornerRadius(4)
          Spacer()
        }
        .padding()
        .frame(height: 60)
      }
      .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.99)]), startPoint: .top, endPoint: .bottom))
    }
    .foregroundColor(.white)
  }
}

struct MovieItemFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
      MovieItemFeaturedView(movie: MovieModel(id: "1", name: "Spider Man", durationMinutes: 200, releaseDate: 2000, ageRestriction: "R", thumbnailImageId: "test", description: "Awesome movie", popularityIndex: 12, netflixReleaseDate: 12334, isOriginal: true,
                                         tags: "", genres: "", cast: ""),
                            isInWatchlist: true, onTapMyList: {})
    }
}
