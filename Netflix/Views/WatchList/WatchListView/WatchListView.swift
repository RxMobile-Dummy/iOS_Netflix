//
//  WatchListView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 18/08/22.
//

import SwiftUI

//MARK: - WatchListView Object of View
struct WatchListView: View {

  /// moviesVM environmentObject of MoviesVM
  @EnvironmentObject var moviesVM: MoviesVM

  var body: some View {
    ZStack {
      Color(.black).ignoresSafeArea()
      ScrollView(.vertical , showsIndicators: false) {
        if(!(moviesVM.movies["watchlist"] ?? []).isEmpty) {
          /// Movie Grid View
          MovieGridView(movies: moviesVM.movies["watchlist"] ?? [])
        } else {
          Text(kYOU_HAVE_NO_ITEMS_IN_YOUR_WATCHLIST)
            .foregroundColor(Color.white)
        }
      }.padding()
    }
  }
}

//MARK: - WatchListView Previews 
struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
