//
//  MovieCollectionView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import SwiftUI

struct MovieCollectionView: View {
  
  let movies: [MovieModel]
  let title: String
  let itemHeight: CGFloat?
  let itemWidth: CGFloat?
  let frameHeight: CGFloat?
  
  init(title: String, movies: [MovieModel], frameHeight: CGFloat? = nil, itemWidth: CGFloat? = nil, itemHeight: CGFloat? = nil) {
    self.title = title
    self.frameHeight = frameHeight
    self.itemWidth = itemWidth
    self.itemHeight = itemHeight
    self.movies = movies
  }
  
  var body: some View {
    VStack (alignment: .leading) {
      Text(title)
        .font(.headline)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(movies) { movie in
            MovieItemThumbnailView(movie: movie)
              .frame(width: itemWidth, height: itemHeight)
          }
        }
        .frame(height: frameHeight)
      }
    }
  }
}

struct MovieCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    MovieCollectionView(title: "Movies", movies: [],
                        itemWidth: 100, itemHeight: 200)
  }
}
