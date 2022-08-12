//
//  SplashView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

struct SplashView: View {
  var body: some View {
      ZStack {
          Color(.black).ignoresSafeArea()
          Image("Ico")
              .resizable()
              .frame(width: 50.0, height: 50.0)
      }
  }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
