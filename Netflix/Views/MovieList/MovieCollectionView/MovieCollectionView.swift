//
//  MovieCollectionView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import SwiftUI

//MARK: - Movie Collection View
struct MovieCollectionView: View {

  /// movies object of [MovieModel]
  let movies: [MovieModel]
  /// title object of String
  let title: String
  /// itemHeight object of CGFloat
  let itemHeight: CGFloat?
  /// itemWidth object of CGFloat
  let itemWidth: CGFloat?
  /// frameHeight object of CGFloat
  let frameHeight: CGFloat?

  //MARK: - Init Method
  /**
   - Parameter title : Object of String
   - Parameter movies : Object of [MovieModel]
   - Parameter frameHeight : Object of CGFloat
   - Parameter itemWidth : Object of CGFloat
   - Parameter itemHeight : Object of CGFloat
   */
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
            /// MovieItemThumbnail View
            MovieItemThumbnailView(movie: movie)
              .frame(width: itemWidth, height: itemHeight)
          }
        }
        .frame(height: frameHeight)
      }
    }
  }
}

//MARK: - MovieCollectionView Previews
struct MovieCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    MovieCollectionView(title: "Movies", movies: [],
                        itemWidth: 100, itemHeight: 200)
  }
}
