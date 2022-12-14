//
//  WatchList.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import Foundation

class WatchlistModel: Identifiable {
  public let id: String
  public let movieId: String
  public let userId: String
  public let createdAt: Int

  init(
    id: String,
    movieId: String,
    userId: String,
    createdAt: Int

  ) {
    self.id = id
    self.movieId = movieId
    self.userId = userId
    self.createdAt = createdAt
  }
  
  public static func from(map: [String: Any]) -> WatchlistModel {
    return WatchlistModel(
      id: map["$id"] as! String,
      movieId: map["movieId"] as! String,
      userId: map["userId"] as! String,
      createdAt: map["createdAt"] as! Int
    )
  }

  public func toMap() -> [String: Any] {
    return [
      "userId": userId as Any,
      "movieId": movieId as Any,
      "createdAt": createdAt as Any
    ]
  }
}
