//
//  Movie.swift
//  Netflix
//
//  Created by Devangi Prajapati on 12/08/22.
//

import Foundation

class MovieModel: Identifiable {
    public let id: String
    public let name: String
    public let durationMinutes: Int
    public let releaseDate: Int?
    public let ageRestriction: String
    public let thumbnailImageId: String
    public let description: String
    public let popularityIndex: Float?
    public let netflixReleaseDate: Int
    public let isOriginal: Bool
    public let tags: String
    public let genres: String
    public let cast: String
    public let imageUrl: String

    public func duration() -> String {
        let hours = durationMinutes / 60
        let minutes = durationMinutes % 60
        return "\(hours)h \(minutes)m"
    }

    public func releaseYear() -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(releaseDate ?? 0))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "YYYY"

        // UnComment below to get only time
        //  dayTimePeriodFormatter.dateFormat = "hh:mm a"

        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }

    init(
        id: String,
        name: String,
        durationMinutes: Int,
        releaseDate: Int?,
        ageRestriction: String,
        thumbnailImageId: String,
        description: String,
        popularityIndex: Float?,
        netflixReleaseDate: Int,
        isOriginal: Bool,
        tags: String,
        genres: String,
        cast: String
    ) {
        self.id = id
        self.name = name
        self.durationMinutes = durationMinutes
        self.releaseDate = releaseDate
        self.ageRestriction = ageRestriction
        self.thumbnailImageId = thumbnailImageId
        self.description = description
        self.popularityIndex = popularityIndex
        self.netflixReleaseDate = netflixReleaseDate
        self.isOriginal = isOriginal
        self.tags = tags
        self.genres = genres
        self.cast = cast
        self.imageUrl = AppwriteService.shared.client.endPoint + "/storage/buckets/62fce1d433e85bdf20e6/files/" + thumbnailImageId + "/preview?project=netflixProjectID&width=320&height=480"
        //self.imageUrl = AppwriteService.shared.client.endPoint + "/storage/files/" + thumbnailImageId + "/preview?project=almostNetflix2&width=320&height=480"
    }

  public static func from(map: [String: Any]) -> MovieModel {
    return MovieModel(
      id: map["$id"] as? String ?? "",
      name: map["name"] as? String ?? "" ,
      durationMinutes: map["durationMinutes"] as? Int ?? 0,
      releaseDate: map["releaseDate"] as? Int ?? 0,
      ageRestriction: map["ageRestriction"] as? String ?? "",
      thumbnailImageId: map["thumbnailImageId"] as? String ?? "",
      description: map["description"] as? String ?? "",
      popularityIndex: map["popularityIndex"] as? Float ?? 0.0,
      netflixReleaseDate: map["netflixReleaseDate"] as? Int ?? 0,
      isOriginal: map["isOriginal"] as? Bool ?? false,
      tags: map["tags"] as? String ?? "" ,
      genres: map["genres"] as? String ?? "" ,
      cast: map["cast"] as? String ?? ""
    )
  }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "durationMinutes": durationMinutes as Any,
            "releaseDate": releaseDate as Any,
            "ageRestriction": ageRestriction as Any,
            "thumbnailImageId": thumbnailImageId as Any,
            "description": description as Any,
            "popularityIndex": popularityIndex as Any,
            "netflixReleaseDate": netflixReleaseDate as Any,
            "isOriginal": isOriginal as Any,
            "cast": cast as Any,
            "genres": genres as Any,
            "tags": tags as Any
        ]
    }
}


class Movie : Codable  , Equatable {
  var ageRestriction: String?
  var durationMinutes: String?
  var thumbnailImageId: String?
  var name: String?
  var description: String?
  var trendingIndex: String?
  var isOriginal: String?
  var releaseDate: String?
  var cast: String?
  var tags: String?
  var genres: String?
  var posterpath: String?

  enum CodingKeys: String, CodingKey {
    case ageRestriction
    case durationMinutes
    case thumbnailImageId
    case name
    case description
    case trendingIndex
    case isOriginal
    case releaseDate
    case cast
    case tags
    case genres
    case posterpath
  }

  static func == (lhs: Movie, rhs: Movie) -> Bool {
    return lhs.trendingIndex == rhs.trendingIndex
  }

  init(ageRestriction: String? , durationMinutes: String? , thumbnailImageId: String? , name: String?  , description: String?   , trendingIndex: String? , isOriginal: String?   , releaseDate: String?, cast : String?,  tags : String? , genres : String? ,  posterpath : String? ) {

    self.ageRestriction = ageRestriction
    self.durationMinutes = durationMinutes
    self.thumbnailImageId = thumbnailImageId
    self.name = name
    self.description = description
    self.trendingIndex = trendingIndex
    self.isOriginal = isOriginal
    self.releaseDate = releaseDate
    self.cast = cast
    self.tags = tags
    self.genres = genres
    self.posterpath = posterpath
  }
}
