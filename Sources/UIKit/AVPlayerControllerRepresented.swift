//
//  AVPlayerControllerRepresented.swift
//  Mindie
//
//  Created by Benjamin Sage on 2/22/23.
//

import SwiftUI
import AVKit

public struct AVPlayerControllerRepresented: UIViewControllerRepresentable {
    var player: AVPlayer
    
    init(player: AVPlayer) {
        Self.configureAudioSession()
        self.player = player
    }
    
    static func configureAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.ambient, mode: .default, options: [.mixWithOthers])
            try audioSession.setActive(true, options: [])
        } catch {
            print("Error configuring audio session: \(error)")
        }
    }
    
    public func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        
        if #available(iOS 16.0, *) {
            controller.allowsVideoFrameAnalysis = false
        }
        
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        if uiViewController.player == nil {
            uiViewController.player = player
        }
    }
}
