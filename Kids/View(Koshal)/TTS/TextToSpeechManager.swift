//
//  TextToSpeechManager.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 28/01/26.
//


//
//  TextToSpeechManager.swift
//

import Foundation
import AVFoundation

final class TextToSpeechManager: NSObject {

    // MARK: - Singleton
    static let shared = TextToSpeechManager()

    // MARK: - Properties
    private let synthesizer = AVSpeechSynthesizer()

    private override init() {
        super.init()
        synthesizer.delegate = self
    }

    // MARK: - Speak
    func speak(
        _ text: String,
        language: String = "en-US",
        rate: Float = 0.45,
        pitch: Float = 0.95,
        volume: Float = 1.0
    ) {
        guard !text.isEmpty else { return }

        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = rate
        utterance.pitchMultiplier = pitch
        utterance.volume = volume

        synthesizer.speak(utterance)
    }

    
    func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
    }

    // MARK: - Controls
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }

    func pause() {
        synthesizer.pauseSpeaking(at: .word)
    }

    func resume() {
        synthesizer.continueSpeaking()
    }

    func isSpeaking() -> Bool {
        synthesizer.isSpeaking
    }
}

// MARK: - AVSpeechSynthesizerDelegate
extension TextToSpeechManager: AVSpeechSynthesizerDelegate {

    func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        didStart utterance: AVSpeechUtterance
    ) {
        print("🔊 TTS started")
    }

    func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        didFinish utterance: AVSpeechUtterance
    ) {
        print("✅ TTS finished")
    }
}
