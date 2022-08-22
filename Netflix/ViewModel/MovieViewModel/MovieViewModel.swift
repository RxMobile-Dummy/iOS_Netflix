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
  
  //MARK: - Movies View Model Object
  /// featured object of MovieModel
  @Published var featured: MovieModel?
  /// movies object of [String:[MovieModel]]
  @Published var movies: [String:[MovieModel]] = [:]
  /// watchList object of [String]
  @Published var watchList: [String] = []
  /// error object of String
  @Published var error: String?
  /// userId object of String
  var userId: String = ""
  
  //MARK: - Init Method
  /**
   - Parameter userId : object of String
   */
  init(userId: String) {
    Task(priority: .medium) {
      self.userId = userId
      do {
        await  getMovies()
        await getFeatured()
      }
    }
  }
  
  //MARK: - Get My WatchList Method
  func getMyWatchlist() async {
    do {
      let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: kCOLLECTIONID_MOVIES, queries: [Query.equal("$id",value: watchList)])
      self.movies[kWATCHLIST] = response?.convertTo(fromJson: MovieModel.from)
      print("successfully added to watchlist")
    }
  }
  
  //MARK: - Add To WatchList Method
  /**
   - Parameter movieId : Object of String
   */
  func addToMyList(_ movieId: String) async {
    if(self.watchList.contains(movieId)) {
      await removeFromMyList(movieId)
    } else {
      do {
        let response =  try? await AppwriteService.shared.database.createDocument(collectionId: kCOLLECTIONID_WATCHLISTS, documentId: "unique()", data: ["userId": userId, "movieId": movieId, "createdAt": Int(NSDate.now.timeIntervalSince1970)], read:  ["user:\(userId)"], write: ["user:\(userId)"])
        if(response?.id != "") {
          self.watchList.append(movieId)
          await self.getMyWatchlist()
          print("successfully added to watchlist")
        }
      }
    }
  }
  
  //MARK: - Remove From WatchList Method
  /**
   - Parameter movieId : Object of String
   */
  func removeFromMyList(_ movieId: String) async {
    do {
      let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: kCOLLECTIONID_WATCHLISTS, queries: [ Query.equal("userId", value: userId),
                                                                                                                                   Query.equal("movieId", value: movieId)] , limit: 1)
      if(response?.total != 0) {
        let responseDelete =  try? await  AppwriteService.shared.database.deleteDocument(collectionId: kCOLLECTIONID_WATCHLISTS, documentId: response?.documents.first!.id ?? "")
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
  
  //MARK: - Check In WatchList Method
  /**
   - Parameter movieId : Object of [String]
   */
  func isInWatchlist(_ movieIds: [String]) async {
    do {
      let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: kCOLLECTIONID_WATCHLISTS, queries: [ Query.equal("userId", value: userId),
                                                                                                                                   Query.equal("movieId", value: movieIds)] , limit: 1)
      if(response?.total != 0) {
        let docs = response?.convertTo(fromJson: WatchlistModel.from)
        for doc in (docs ?? []) {
          self.watchList.append(doc.movieId)
        }
        if((docs?.count ?? 0) > 0) {
          await self.getMyWatchlist()
        }
      }
    }
  }
  
  //MARK: - Get Featured Method
  func getFeatured() async {
    do {
      let response = try await  AppwriteService.shared.database.listDocuments(collectionId: kCOLLECTIONID_MOVIES, limit: 1 , orderAttributes: ["trendingIndex"] , orderTypes: ["DESC"] )
      if(response.total != 0) {
        self.featured = response.convertTo(fromJson: MovieModel.from).first
        if(self.featured != nil) {
          await self.isInWatchlist([self.featured!.id])
        }
      }
    } catch let err {
      print(err.localizedDescription)
    }
  }
  
  //MARK: - Get Movies Method
  func getMovies()  async {
    Task {
      do {
        for category in appwriteCategories {
          let response =  try? await  AppwriteService.shared.database.listDocuments(collectionId: kCOLLECTIONID_MOVIES, queries: category.queries, orderAttributes: category.orderAttributes, orderTypes: category.orderTypes)
          if(response != nil) {
            self.movies[category.id] = response?.convertTo(fromJson: MovieModel.from)
            await self.isInWatchlist(response?.documents.map { $0.id } ?? []);
          }
        }
      }
    }
  }
}
