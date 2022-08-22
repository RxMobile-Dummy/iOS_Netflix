//
//  MovieGridView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 18/08/22.
//

import SwiftUI
import UIKit

struct MovieGridView: View {
  let movies: [MovieModel]
  var body: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .leading, spacing: 4) {
      ForEach(movies) { movie in
        MovieItemThumbnailView(movie: movie)
      }
    }
  }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
      MovieGridView(movies: [])
    }
}
