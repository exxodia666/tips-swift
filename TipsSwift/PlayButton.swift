//
//  PlayButton.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//

import SwiftUI


struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}

struct PlayButton_Previews: PreviewProvider {
    @State static private var isPlaying: Bool = false
    static var previews: some View {
        PlayButton(isPlaying: $isPlaying)
    }
}
