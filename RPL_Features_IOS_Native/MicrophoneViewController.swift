//
//  MicSpeakerViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 13/09/21.
//

import UIKit
import InstantSearchVoiceOverlay


class MicrophoneViewController: UIViewController, VoiceOverlayDelegate {

    let voiceOverlay = VoiceOverlayController()
    
    @IBOutlet var playBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBTN.backgroundColor = .systemRed
        playBTN.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func didTapButton() {
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStart = true
        voiceOverlay.settings.autoStop = true
        voiceOverlay.settings.autoStopTimeout = 5
        voiceOverlay.start(on: self, textHandler: { text, final, _ in
            if final {
                print("Final text: \(text)")
            } else {
//                print("In Progress: \(text)")
            }
        }, errorHandler: { error in
            
        })
    }
    
    func recording(text: String?, final: Bool?, error: Error?) {
        
    }
}
