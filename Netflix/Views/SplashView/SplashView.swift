//
//  SplashView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

//MARK: - Splash View
struct SplashView: View {
  var body: some View {
      ZStack {
          Color(.black).ignoresSafeArea()
          Image(kIMG_Ico)
              .resizable()
              .frame(width: 50.0, height: 50.0)
      }
  }
}

//MARK: - SplashView_Previews
struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    SplashView()
  }
}
