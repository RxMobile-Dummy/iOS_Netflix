//
//  SignUpView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

//MARK: - SignUp View
struct SignUpView: View {

  /// name object of String
  @State private var name = ""
  /// email object of String
  @State private var email = ""
  /// password object of String
  @State private var password = ""
  /// authVM object of AuthVM
  @EnvironmentObject var authVM: AuthVM
  /// isLoading static private object of Bool
  @State private var isLoading = false
  /// strError static private object of String
  @State private var strError = ""

  var body: some View {
    ZStack {
      VStack {
        Text(kSIGNUP)
          .foregroundColor(.white)
          .font(.largeTitle)
          .bold()
          .padding(.top)
        
        CustomTextField(placeHolder: Text(kNAME).foregroundColor(Color.white), text: self.$name)
          .padding()
          .background(Color.gray.opacity(0.2))
          .foregroundColor(Color.white)
          .cornerRadius(8.0)
        
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
        
        Button(kSIGNUP) {
          Task {
            do {
              isLoading = true
              try await authVM.create(name: name, email: email, password: password, completion: { isSuccess,error  in
                if(isSuccess == true) {
                  isLoading = false
                  strError = error
                } else {
                  isLoading = false
                  strError = error
                }
              })
            } catch{
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
