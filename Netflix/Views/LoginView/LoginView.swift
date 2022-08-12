//
//  LoginView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

struct LoginView: View {
  
  @State private var email = ""
  @State private var password = ""
  /// isLoading static private object of Bool
  @State private var isLoading = false
  
  @EnvironmentObject var authVM: AuthVM
  
  var body: some View {
    ZStack {
      VStack {
        Text("Sign In")
          .foregroundColor(.white)
          .font(.largeTitle)
          .bold()
          .padding()

        CustomTextField(placeHolder: Text("E-mail").foregroundColor(Color.white), text: self.$email)
          .padding()
          .background(Color.gray.opacity(0.2))
          .foregroundColor(Color.white)
          .cornerRadius(8.0)

        CustomSecaureTextField(placeHolder: Text("Password").foregroundColor(Color.white), text: self.$password)
          .padding()
          .background(Color.gray.opacity(0.2))
          .foregroundColor(Color.white)
          .cornerRadius(8.0)


        Button("Login") {
          Task {
            do {
              isLoading = true
              try await authVM.login(email: email, password: password, completion: { success in
                if(success == true) {
                  isLoading = false
                }
              })
            }
          }
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .cornerRadius(8.0)

      }
      .padding()
      .frame(maxHeight: .infinity)
      .background(
        Image("Background")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .edgesIgnoringSafeArea(.vertical)
      )

      /// ProgresBar View
      if (isLoading == true) {
        LoadingView()
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
