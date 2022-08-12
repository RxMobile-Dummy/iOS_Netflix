//
//  AuthViewModel.swift
//  NetflixData
//
//  Created by Devangi Prajapati on 10/08/22.
//

import Foundation
import Appwrite
import Network

class AuthVM: ObservableObject {

  @Published var checkedForUser = false
  @Published var error: String?
  @Published var user: User?

  static var shared = AuthVM()

  init()  {
    Task(priority: .medium){
      do {
        try await getAccount()
      } catch let err {
        self.error = err.localizedDescription
      }
    }
  }

  private func getAccount() async throws {
    do {
      let response = try await AppwriteService.shared.account.get()
      DispatchQueue.main.async {
        self.checkedForUser = true
        if(response.id != "") {
          self.user = response
        }
      }
    } catch let err {
      DispatchQueue.main.async {
        self.checkedForUser = true
        DispatchQueue.main.async {
          self.error = err.localizedDescription
          self.user = nil
        }
      }
    }
  }

  func create(name: String, email: String, password: String , completion: @escaping (Bool) -> Void) async  throws{
    do {
      let response : User  = try await AppwriteService.shared.account.create(userId: "unique()", email: email, password: password, name: name)
      if(response.id != "") {
        completion(true)
        try await self.login(email: email, password: password, completion: { isSuccess in
        })
      }
    } catch let err {
      completion(false)
      DispatchQueue.main.async {
        self.error = err.localizedDescription
        self.user = nil
      }
    }
  }

  func logout() async throws {
    do {
      _ = try await AppwriteService.shared.account.deleteSession(sessionId: "current")
      self.user = nil
      self.error = nil
    } catch let err {
      DispatchQueue.main.async {
        self.error = err.localizedDescription
        self.user = nil
      }
    }
  }

  func loginAnonymous() async throws{
    do {
      let response = try await AppwriteService.shared.account.createAnonymousSession()
      if(response.id != "") {
        try await self.getAccount()
      }
    } catch let err {
      DispatchQueue.main.async {
        self.error = err.localizedDescription
        self.user = nil
      }
    }
  }

  public func login(email: String, password: String , completion: @escaping (Bool) -> Void) async throws {
    do {
      let response = try await AppwriteService.shared.account.createEmailSession(email: email, password: password)
      if(response.id != "") {
        completion(true)
        try await self.getAccount()
      }
    } catch let err {
      completion(false)
      DispatchQueue.main.async {
        self.error = err.localizedDescription
        self.user = nil
      }
    }
  }
}
