//
//  VoiceSpeaker.swift
//  FirstJapaneseLife
//
//  Created by G-Xi0N on 2017/12/14.
//  Copyright © 2017年 G-Xi0N. All rights reserved.
//

import AVFoundation

struct VoiceSpeaker {
    
    static let synthesizer = AVSpeechSynthesizer()
    
    public static func speak(_ word: String) {
        
        guard !synthesizer.isPaused else {
            continueSpeaking()
            return
        }
        guard !synthesizer.isSpeaking else {
            pauseSpeaking()
            return
        }
        
        let utterance = AVSpeechUtterance(string: word)
        let voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
    
    public static func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    public static func continueSpeaking() {
        synthesizer.continueSpeaking()
    }
    
    public static func pauseSpeaking() {
        synthesizer.pauseSpeaking(at: .immediate)
    }
}
