//
//  VideoView.swift
//  Netflix
//
//  Created by Devangi Prajapati on 19/08/22.
//

import AVKit
import SwiftUI
//import YouTubePlayerKit

//MARK: - VideoView View
struct VideoView: View {
  //let url = URL(string: "https://www.youtube.com/watch?v=pxl0rQ6TeXI&hl=id&client=mv-google&gl=ID&fulldescription=1&app=desktop&persist_app=1")!

  // let youTubePlayer: YouTubePlayer = "https://www.youtube.com/watch?v=pxl0rQ6TeXI&hl=id&client=mv-google&gl=ID&fulldescription=1&app=desktop&persist_app=1"

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      ///1. First Step
      //      YouTubePlayerView(self.youTubePlayer) { state in
      //        // Overlay ViewBuilder closure to place an overlay View
      //        // for the current `YouTubePlayer.State`
      //        switch state {
      //        case .idle:
      //          LoadingView()
      //        case .ready:
      //          EmptyView()
      //        case .error(_):
      //          Text(verbatim: "YouTube player couldn't be loaded")
      //        }
      //      }

      ///2. Step
      VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "DDLJ", withExtension: "mp4")!))
        .edgesIgnoringSafeArea(.all)

      ///3. Step
      //      VideoFileView(videoId: "pxl0rQ6TeXI")
      //        .cornerRadius(12)
      //        .padding(.horizontal , 24)
    }
  }
}

//MARK: - ViewView Preview 
struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
