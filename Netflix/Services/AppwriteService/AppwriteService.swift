//
//  AppwriteService.swift
//  NetflixData
//
//  Created by Devangi Prajapati on 10/08/22.
//

import Foundation
import AppwriteModels
import Appwrite

class AppwriteService {
  let client: Client
  //let database: Database
  let account: Account
  let storage: Storage
  let avatars: Avatars
  
  static let shared = AppwriteService()
  
  init() {
    client = Client()
      .setEndpoint("http://localhost/v1")
      .setProject("netflixProjectID")
      .setSelfSigned()
    
    //database = Database(client)
    account = Account(client)
    storage = Storage(client)
    avatars = Avatars(client)
  }
}
