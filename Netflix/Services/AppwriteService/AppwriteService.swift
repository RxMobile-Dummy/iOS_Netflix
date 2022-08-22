//
//  AppwriteService.swift
//  NetflixData
//
//  Created by Devangi Prajapati on 10/08/22.
//

import Foundation
import Appwrite

class AppwriteService {

  /// Appwrite client object
  let client: Client
  /// Appwrite Databases object
  let database: Databases
  /// Appwrite Account object
  let account: Account
  /// Appwrite Storage object
  let storage: Storage
  /// Appwrite Avatars object
  let avatars: Avatars

  /// AppwriteService object to call method
  static let shared = AppwriteService()
  
  //MARK: - App Service Init Method
  init() {
    client = Client()
      .setEndpoint(kMAINURL)
      .setProject(kPROJECTID)
      .setSelfSigned()
    database = Databases(client, kDATABASEID)
    account = Account(client)
    storage = Storage(client)
    avatars = Avatars(client)
  }
}
