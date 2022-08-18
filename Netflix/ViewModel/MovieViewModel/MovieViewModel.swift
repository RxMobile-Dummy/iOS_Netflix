//
//  MovieViewModel.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import Foundation
import Appwrite
import UIKit
import SwiftyJSON

class MoviesVM: ObservableObject {

  @Published var featured: MovieModel?
  @Published var movies: [String:[MovieModel]] = [:]
  @Published var watchList: [String] = []
  @Published var error: String?

  var userId: String = ""

  init(userId: String) {
    Task(priority: .medium) {
      do {
        self.userId = userId
        await  getMovies()
        await getFeatured()
      }
    }
  }


  func getMyWatchlist() async {
    do {
      let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: "movies", queries: [Query.equal("$id",value: watchList)])
      self.movies["watchlist"] = response?.convertTo(fromJson: MovieModel.from)
      print("successfully added to watchlist")
    }
  }


  func addToMyList(_ movieId: String) async {
    if(self.watchList.contains(movieId)) {
      await removeFromMyList(movieId)
    } else {
      do {
        let response =  try? await AppwriteService.shared.database.createDocument(collectionId: "watchlists", documentId: "unique()", data: ["userId": userId, "movieId": movieId, "createdAt": Int(NSDate.now.timeIntervalSince1970)], read:  ["user:\(userId)"], write: ["user:\(userId)"])
        if(response?.id != "") {
          self.watchList.append(movieId)
          await self.getMyWatchlist()
          print("successfully added to watchlist")
        }
      }
    }
  }

  func removeFromMyList(_ movieId: String) async {
    do {
      let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: "watchlists", queries: [ Query.equal("userId", value: userId),
                                                                                                                      Query.equal("movieId", value: movieId)] , limit: 1)
      if(response?.total != 0) {
        let responseDelete =  try? await  AppwriteService.shared.database.deleteDocument(collectionId: "watchlists", documentId: response?.documents.first!.id ?? "")
        if(responseDelete != nil) {
          let index = self.watchList.firstIndex(of: movieId)
          if(index != nil) {
            self.watchList.remove(at: index!)
            await self.getMyWatchlist()
            print("removed from watchlist")
          }
        }
      }
    }
  }

  func isInWatchlist(_ movieIds: [String]) async {
    do {
      let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: "watchlists", queries: [ Query.equal("userId", value: userId),
                                                                                                                       Query.equal("movieId", value: movieIds)] , limit: 1)
      if(response?.total != 0) {
        let docs = response?.convertTo(fromJson: WatchlistModel.from)
        for doc in (docs ?? []) {
          self.watchList.append(doc.movieId)
        }
        if((docs?.count ?? 0) > 1) {
          await self.getMyWatchlist()
        }
      }
    }
  }

  func getFeatured() async {
    do {
      let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: "movies", limit: 1 , orderAttributes: ["trendingIndex"] , orderTypes: ["DESC"] )
      if(response?.total != 0) {
        self.featured = response?.convertTo(fromJson: MovieModel.from).first
        if(self.featured != nil) {
          await self.isInWatchlist([self.featured!.id])
        }
      }
    }
  }


  func getMovies()  async {
    Task {
      do {
        for category in appwriteCategories {
          let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: "movies", queries: category.queries, orderAttributes: category.orderAttributes, orderTypes: category.orderTypes)
          if(response != nil) {
            self.movies[category.id] = response?.convertTo(fromJson: MovieModel.from)
            print(self.movies)
            await self.isInWatchlist(response?.documents.map { $0.id } ?? []);
          }
        }
      }
    }
  }
}
