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

  //MARK: - Auth View Model  Object
  /// checkedForUser object of AuthVM
  @Published var checkedForUser = false
  /// error object of AuthVM
  @Published var error: String?
  /// user object of AuthVM
  @Published var user: User?
  /// shared object of AuthVM
  static var shared = AuthVM()

  //MARK: - init Method
  init()  {
    Task(priority: .medium){
      do {
        /// Get logged User
        try await getAccount()
      } catch let err {
        self.error = err.localizedDescription
      }
    }
  }

  //MARK: - Get Logged Account Method
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
        self.error = err.localizedDescription
        self.user = nil
      }
    }
  }

  //MARK: - Create Account With Appwrite Method
  /**
   - Parameter name : Object of String
   - Parameter email : Object of String
   - Parameter password : Object of String
   - Parameter completion : Object of (Bool , String)
   */
  func create(name: String, email: String, password: String , completion: @escaping (Bool , String) -> Void) async  throws{
    do {
      let response : User  = try await AppwriteService.shared.account.create(userId: "unique()", email: email, password: password, name: name)
      if(response.id != "") {
        completion(true , kSIGNUP_SUCCESSFULLY_DONE)
        self.user = response
        kUSERDEFAULT.set(response.id, forKey: "userId")
        try await self.login(email: email, password: password, completion: { isSuccess,error  in
        })
      }
    } catch let err {
      completion(false , err.localizedDescription)
      DispatchQueue.main.async {
        self.error = err.localizedDescription
        self.user = nil
      }
    }
  }

  //MARK: - LogOut Method
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

  //MARK: - Login Method
  /**
   - Parameter email : Object of String
   - Parameter password : Object of String
   - Parameter completion : Object of (Bool , String)
   */
  public func login(email: String, password: String , completion: @escaping (Bool , String) -> Void) async throws {
    do {
      let response = try await AppwriteService.shared.account.createEmailSession(email: email, password: password)
      if(response.id != "") {
        try await self.getAccount()
        completion(true , kLOGIN_SUCCESSFULLY_DONE)
      }
    } catch let err {
      completion(false , err.localizedDescription)
      DispatchQueue.main.async {
        self.error = err.localizedDescription
        self.user = nil
      }
    }
  }
}
