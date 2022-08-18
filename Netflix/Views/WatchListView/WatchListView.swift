//
//  WatchListView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 18/08/22.
//

import SwiftUI

struct WatchListView: View {
  @EnvironmentObject var moviesVM: MoviesVM
  var body: some View {
    ZStack {
      Color(.black).ignoresSafeArea()
      ScrollView(.vertical, showsIndicators: false) {
        if(!(moviesVM.movies["watchlist"] ?? []).isEmpty) {
          MovieGridView(movies: moviesVM.movies["watchlist"] ?? [])
        }
      }

      if((moviesVM.movies["watchlist"] ?? []).isEmpty){
        Text("You have no items in your watchlist")
          .bold()
          .font(.subheadline)
          .foregroundColor(.white)
      }
    }
  }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
