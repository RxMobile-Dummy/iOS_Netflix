//
//  MovieItemThumbnailView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import SwiftUI
import Kingfisher

struct MovieItemThumbnailView: View {

  let movie: MovieModel
  let newReleased = false

    var body: some View {
      ZStack {
          NavigationLink (destination: MovieDetailsView(movie: movie)) {
              KFImage.url(URL(string: movie.imageUrl))
                  .resizable()
                  .scaledToFit()
                  .cornerRadius(4)
          }
          .navigationTitle("")
      }
    }
}

struct MovieItemThumbnailView_Previews: PreviewProvider {
  static var previews: some View {
    MovieItemThumbnailView(movie: MovieModel(id: "1", name: "Spider Man", durationMinutes: 200, releaseDate: 2000, ageRestriction: "R", thumbnailImageId: "test", description: "Awesome movie", popularityIndex: 12, netflixReleaseDate: 12334, isOriginal: true, tags: "", genres: "", cast: ""))
  }
}