//
//  LoginView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI
//MARK: - LoginView
struct LoginView: View {

  /// email object of String
  @State private var email = ""
  /// password object of String
  @State private var password = ""
  /// isLoading static private object of Bool
  @State private var isLoading = false
  /// strError static private object of String
  @State private var strError = ""
  /// authVM object of AuthVM
  @EnvironmentObject var authVM: AuthVM
  
  var body: some View {
    ZStack {
      VStack {
        Text(kSIGNIN)
          .foregroundColor(.white)
          .font(.largeTitle)
          .bold()
          .padding()

        CustomTextField(placeHolder: Text(kEMAIL).foregroundColor(Color.white), text: self.$email)
          .padding()
          .background(Color.gray.opacity(0.2))
          .foregroundColor(Color.white)
          .cornerRadius(8.0)

        CustomSecaureTextField(placeHolder: Text(kPASSWORD).foregroundColor(Color.white), text: self.$password)
          .padding()
          .background(Color.gray.opacity(0.2))
          .foregroundColor(Color.white)
          .cornerRadius(8.0)


        Button(kLOGIN) {
          Task {
            do {
              isLoading = true
              try await authVM.login(email: email, password: password, completion: { success,error  in
                if(success == true) {
                  isLoading = false
                  strError = error
                } else {
                  isLoading = false
                  strError = error
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

        Text(strError)
          .bold()
          .foregroundColor(.white)
          .font(.headline)

      }
      .padding()
      .frame(maxHeight: .infinity)
      .background(
        Image(kIMG_BACKGROUND)
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
