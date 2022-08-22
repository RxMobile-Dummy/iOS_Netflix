//
//  MainView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

//MARK: - MainView
struct MainView: View {

  /// authVM object of AuthVM
  @EnvironmentObject var authVM: AuthVM

  var body: some View {
    Group {
      if !authVM.checkedForUser {
        /// SplashView
        SplashView()
      } else if authVM.user != nil {
        /// HomeView
        HomeView().environmentObject(MoviesVM(userId: authVM.user!.id))
      } else {
        /// TitleView
        TitleView()
      }
    }
    .animation(.easeInOut)
    .transition(.move(edge: .bottom))
  }
}

//MARK: - MainView_Previews 
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
