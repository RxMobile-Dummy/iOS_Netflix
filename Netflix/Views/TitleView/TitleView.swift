//
//  TitleView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

//MARK: - TitleView
struct TitleView: View {

  /// selection object of String
  @State private var selection: String? = nil
  
  var body: some View {
    NavigationView {
      VStack {
        
        Text(kALMOST_NETFLIX)
          .foregroundColor(.white)
          .font(.largeTitle)
          .bold()
          .padding(.top)
        
        Text(kALMOST_THE_BEST_NETFLIX_CLONE)
          .foregroundColor(.white)
          .font(.title2)
          .bold()
          .padding(.top)
          .padding(.bottom)
        
        NavigationLink(destination: LoginView(), tag: kSIGNIN, selection: $selection) {}
        .navigationTitle("")
        NavigationLink(destination: SignUpView(), tag: kSIGNUP, selection: $selection) {}
        .navigationTitle("")
        
        Button(kSIGNIN) {
          self.selection = "Sign In"
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .cornerRadius(8.0)
        
        Button(kSIGNUP) {
          self.selection = "Sign Up"
        }
        .foregroundColor(.red)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(8.0)
        
      }
      .padding()
      .frame(maxHeight: .infinity)
      .background(
        Image(kIMG_BACKGROUND)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .edgesIgnoringSafeArea(.vertical)
      )
    }
    .accentColor(Color.red)
  }
}

//MARK: - Title View Previews
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
