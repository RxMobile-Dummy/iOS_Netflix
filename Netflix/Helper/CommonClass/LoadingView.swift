//
//  LoadingView.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import SwiftUI

struct LoadingView: View {
  //MARK: - Body View Of ProgressBar
  var body: some View {
    VStack(alignment: .center, content: {
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: .red))
        .scaleEffect(2)
        .background(Color.white)
    })
      .frame(width: 100, height: 100, alignment: .center)
  }
}
