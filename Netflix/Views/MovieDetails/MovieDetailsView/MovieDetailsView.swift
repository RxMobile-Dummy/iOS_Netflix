//
//  MovieDetailsView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import SwiftUI

struct MovieDetailsView: View {
  let movie: MovieModel
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct MovieDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetailsView(movie: MovieModel(id: "1", name: "Spider Man", durationMinutes: 200, releaseDate: 2000, ageRestriction: "R", thumbnailImageId: "test", description: "Awesome movie", popularityIndex: 12, netflixReleaseDate: 12334, isOriginal: true,
                                       tags: "", genres: "", cast: ""))
  }
}
