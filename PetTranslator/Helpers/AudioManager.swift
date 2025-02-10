//
//  AudioManager.swift
//  PetTranslator
//
//  Created by Zabroda Gleb on 09.02.2025.
//

import AVFoundation

class AudioPermissionManager {
    static let shared = AudioPermissionManager()
    
    private init() { }
    
    func checkMicrophonePermission() -> AVAudioSession.RecordPermission {
        return AVAudioSession.sharedInstance().recordPermission
    }
    
    func requestMicrophoneAccess() async -> Bool {
        let status = checkMicrophonePermission()
        
        switch status {
        case .granted:
            return true
        case .denied:
            return false
        case .undetermined:
            return await withCheckedContinuation { continuation in
                AVAudioSession.sharedInstance().requestRecordPermission { granted in
                    continuation.resume(returning: granted)
                }
            }
        @unknown default:
            return false
        }
    }
}


