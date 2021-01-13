//
//  NowPlayingView.swift
//  Melodies
//
//  Created by althio on 2021-01-12.
//

import SwiftUI

struct CoolButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? CGFloat(0.85) : 1.0)
            .rotationEffect(.degrees(configuration.isPressed ? 0.0 : 0))
            .blur(radius: configuration.isPressed ? CGFloat(0.0) : 0)
            .animation(Animation.spring(response: 0.35, dampingFraction: 0.35, blendDuration: 1))
            .padding(.bottom, 3)
    }
}

struct NowPlayingView: View {
    @State var now = Date()
    @State var playing: Bool = false
    @State var currentPositionInSong = 0.0
    @Binding var albumName: String
    @Binding var artistName: String
    @Binding var currentSong: String
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        VStack {
//          Album Art
            Image(albumName).resizable()
                .frame(width: 250, height: 250)
                .cornerRadius(10)
                .padding()
                .shadow(radius: 6)
//          descriptions
            HStack {
                VStack(alignment: .leading) {
                    Text(currentSong)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(artistName) ~ \(albumName)")
                        .font(.title2)
                }
                Spacer()
            }
            .frame(width: 250)
//          Time slider
            Slider(value: $currentPositionInSong, in:0.0...180.0)
                .accentColor(Color.white)
                .onReceive(timer) { input in
                    if playing {
                        currentPositionInSong = currentPositionInSong + 1
                    }
                }
                .frame(width: 250)
//          Controls
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 30))
                        .padding()
                        .shadow(radius: 3)
                })
                .buttonStyle(CoolButtonStyle())
                Button(action: {
                    self.playing.toggle()
                }, label: {
                    if playing {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 45))
                            .padding()
                            .shadow(radius: 3)
                    } else {
                        Image(systemName: "play.fill")
                            .font(.system(size: 45))
                            .padding()
                            .shadow(radius: 3)
                    }
                })
                .buttonStyle(CoolButtonStyle())
                Button(action: {
                    
                }, label: {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 30))
                        .padding()
                        .shadow(radius: 3)
                })
                .buttonStyle(CoolButtonStyle())
            }
            .frame(maxWidth: 250)
        }

    }
}
