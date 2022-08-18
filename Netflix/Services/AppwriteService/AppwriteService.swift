//
//  AppwriteService.swift
//  NetflixData
//
//  Created by Devangi Prajapati on 10/08/22.
//

import Foundation
import Appwrite

class AppwriteService {
  
  let client: Client
  
  let database: Databases
  let account: Account
  let storage: Storage
  let avatars: Avatars
  // let users : Users
  
  static let shared = AppwriteService()
  
  init() {

    //    client = Client()
    //      .setEndpoint("http://localhost/v1") // Your API Endpoint
    //      .setProject("netflixProjectID") // Your project ID
    //      .setKey("e058a8a6f9b3c58cf5794f0b962f8092f2bc03289da2d1474a5a487721a38109eee23e1f39d9819d549dec06d4974654ca7a1d0fd6851a32ecca25f2b293470858ad518a358d5a7bf689a2dfa97e4ec37cb46fb018ef6d0fd45db883d8e13246bd9beec855615a63c13dfb569a943a49e9d60f02a5c2a4a5ebf5d3d72fe8a17e")

    client = Client()
      .setEndpoint("http://localhost/v1")
      .setProject("netflixProjectID")
      .setSelfSigned()
    //users = Users(client)
    database = Databases(client, "netflixDataBaseId")
    account = Account(client)
    storage = Storage(client)
    avatars = Avatars(client)
  }
}
