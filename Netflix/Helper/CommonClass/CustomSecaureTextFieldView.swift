//
//  SecureTextFieldView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 10/08/22.
//

import SwiftUI

struct CustomSecaureTextField: View {
  /// placeHolder object of Text
  var placeHolder : Text
  /// text binding object of String
  @Binding var text : String
  
  /// editingChanged method of type Bool
  var editingChanged : (Bool) -> Void = { _ in}
  /// onCommit method of text
  var commit : () -> Void = {}
  
  //MARK: - Body View
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty { placeHolder }
      SecureField("", text: $text , onCommit: commit)
    }
  }
}
