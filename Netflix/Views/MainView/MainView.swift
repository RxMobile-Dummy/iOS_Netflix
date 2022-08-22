//
//  MainView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

struct MainView: View {
  
  @EnvironmentObject var authVM: AuthVM

  var body: some View {
    Group {
      if !authVM.checkedForUser {
        SplashView()
      } else if authVM.user != nil {
        HomeView().environmentObject(MoviesVM(userId: authVM.user!.id))
      } else {
        TitleView()
      }
    }
    .animation(.easeInOut)
    .transition(.move(edge: .bottom))
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
