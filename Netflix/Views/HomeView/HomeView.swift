//
//  HomeView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject var moviesVM: MoviesVM

  var body: some View {
    NavigationView {
      ZStack {
        Color(.black).ignoresSafeArea()
        ScrollView(.vertical, showsIndicators: false) {
          if(moviesVM.featured != nil) {
            MovieItemFeaturedView(
              movie: moviesVM.featured!,
              isInWatchlist: moviesVM.watchList.contains(moviesVM.featured!.id),
              onTapMyList: {
                Task {
                  await self.onTapMyList(moviesVM.featured!.id)
                }
              }
            )
          } else if(!((moviesVM.movies["movies"] ?? []).isEmpty)) {
            let movie = (moviesVM.movies["movies"]!).first!
            MovieItemFeaturedView(
              movie: movie,
              isInWatchlist: moviesVM.watchList.contains(movie.id),
              onTapMyList: {
                Task {
                  await self.onTapMyList(movie.id)
                }
              }
            )
          }
          
          VStack(alignment: .leading, spacing: 16) {
            ForEach(appwriteCategories) { category in
              if((moviesVM.movies[category.id]?.count ?? 0) > 0) {
                MovieCollectionView(title: category.title, movies: moviesVM.movies[category.id] ?? [])
                  .frame(height: 180)
              }
            }
          }.padding(.horizontal)
        }
      }
      .ignoresSafeArea(.all, edges: .top)
      .foregroundColor(Color.white)
      .navigationBarTitle("Movies")
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          NavigationLink(destination: WatchListView()) {
            Text("My List")
              .frame(width: 100, height: 20, alignment: .center)
              .background(.white)
              .cornerRadius(5.0)
              .foregroundColor(.red)
              .font(.headline)
          }
        }
      }
    }
  }
  
  func onTapMyList(_ movieId: String) async -> Void {
    await moviesVM.addToMyList(movieId)
  }
  
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
