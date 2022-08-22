//
//  VideoFile.swift
//  Netflix
//
//  Created by Devangi Prajapati on 19/08/22.
//

import SwiftUI
import WebKit

//MARK: - VideoFileView Object of UIViewRepresentable
struct VideoFileView : UIViewRepresentable {
  
  /// videoId object of String
  let videoId : String
  
  /// makeUIView method
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  /// updateUIView method
  func updateUIView(_ uiView: WKWebView, context: Context) {
    guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {return}
    uiView.scrollView.isScrollEnabled = false
    uiView.center = CGPoint(x: UIScreen.main.bounds.size.width / 2 , y: UIScreen.main.bounds.size.height / 2)
    uiView.load(URLRequest(url: youtubeURL))
  }
}
