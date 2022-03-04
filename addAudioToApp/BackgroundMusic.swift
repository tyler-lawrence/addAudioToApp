//
//  BackgroundMusic.swift
//  addAudioToApp
//
//  Created by Tyler Lawrence on 3/4/22.
//

import Foundation
import AVFAudio

var backgroundAudioPlayer: AVAudioPlayer?

func startBackgroundMusic(sound: String, type: String) {
    if let bundle = Bundle.main.path(forResource: sound, ofType: type) {
        let backgroundMusic = NSURL(fileURLWithPath: bundle)
        do {
            backgroundAudioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
            guard let backgroundAudioPlayer = backgroundAudioPlayer else { return }
            backgroundAudioPlayer.numberOfLoops = -1
            backgroundAudioPlayer.prepareToPlay()
            backgroundAudioPlayer.play()
        } catch {
            print(error)
        }
    }
}

func stopBackgroundMusic() {
    guard let backgroundAudioPlayer = backgroundAudioPlayer else { return }
    backgroundAudioPlayer.stop()
}
