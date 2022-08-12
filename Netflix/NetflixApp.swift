//
//  NetflixApp.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

@main
struct NetflixApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(AuthVM.shared)
    }
  }
}
