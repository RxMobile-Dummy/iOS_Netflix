//
//  SignUpView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

struct SignUpView: View {
  
  @State private var name = ""
  @State private var email = ""
  @State private var password = ""
  
  @EnvironmentObject var authVM: AuthVM
  
  /// isLoading static private object of Bool
  @State private var isLoading = false
  
  var body: some View {
    ZStack {
      VStack {
        
        Text("Sign Up")
          .foregroundColor(.white)
          .font(.largeTitle)
          .bold()
          .padding(.top)
        
        CustomTextField(placeHolder: Text("Name").foregroundColor(Color.white), text: self.$name)
          .padding()
          .background(Color.gray.opacity(0.2))
          .foregroundColor(Color.white)
          .cornerRadius(8.0)
        
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
        
        Button("Sign Up") {
          Task {
            do {
              isLoading = true
              try await authVM.create(name: name, email: email, password: password, completion: { isSuccess in
                if(isSuccess == true) {
                  isLoading = false
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
