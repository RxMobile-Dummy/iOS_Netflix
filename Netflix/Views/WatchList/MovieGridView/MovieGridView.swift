//
//  MovieGridView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 18/08/22.
//

import SwiftUI
import UIKit

//MARK: - MovieGridView Object of View
struct MovieGridView: View {

  /// movies object of [MovieModel]
  let movies: [MovieModel]

  var body: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .leading, spacing: 4) {
      ForEach(movies) { movie in
        /// Movie Item Thumbnail View 
        MovieItemThumbnailView(movie: movie)
      }
    }
  }
}

//MARK: - MovieGridView Previews
struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
      MovieGridView(movies: [])
    }
}
