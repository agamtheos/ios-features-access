//
//  MicSpeakerViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 13/09/21.
//

import UIKit
import AVFoundation

class MicSpeakerViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    @IBOutlet var PlayBTN: UIButton!
    @IBOutlet var RecordBTN: UIButton!
    
    var soundRecorder = AVAudioRecorder()
    var soundPlayer = AVAudioPlayer()
    var fileName = "audioFile.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        
    }
    
    func setupRecorder() {
        let recordSetts : [String:Any] = [AVFormatIDKey : kAudioFormatAppleLossless,
                           AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
                           AVEncoderBitRateKey : 320000,
                           AVNumberOfChannelsKey : 2,
                           AVSampleRateKey : 44100.0]
        do {
            let soundRecorder = try AVAudioRecorder(url: getFileURL() as URL, settings: recordSetts as [String : Any])
            soundRecorder.delegate = self
            soundRecorder.prepareToRecord()
            
        } catch let error as NSError {
            print("An error occurred: \(error)")
        }
//        if let err = error {
//            NSLog("Something Didnt Work Correctly")
//        }
//        else {
//            soundRecorder.delegate = self
//            soundRecorder.prepareToRecord()
//        }
    }
    
    func getDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        return paths[0] as NSString
    }
    
    func getFileURL() -> NSURL {
        let path = getDirectory().appendingPathComponent(fileName)
        let filePath = NSURL(fileURLWithPath: path)
        return filePath
    }
    
    @IBAction func Record(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {
//            if soundRecorder != nil {
//                print("Contains a value!")
//            } else {
//                print("Doesn’t contain a value.")
//            }
            soundRecorder.record()
            sender.setTitle("Stop", for:.normal)
            PlayBTN.isEnabled = false
        }
        else {
            soundRecorder.stop()
            sender.setTitle("Record", for: .normal)
            PlayBTN.isEnabled = true
        }
    }
    @IBAction func Play(_ sender: UIButton) {
        if sender.titleLabel?.text == "Play" {
            RecordBTN.isEnabled == true
            sender.setTitle("Stop", for: .normal)
            
            preparePlayer()
            soundPlayer.play()
        }else {
            soundPlayer.stop()
            sender.setTitle("Play", for: .normal)
        }
    }
    
    func preparePlayer() {
        do {
            let soundPlayer = try AVAudioPlayer(contentsOf: getFileURL() as URL)
                soundPlayer.delegate = self
                soundPlayer.prepareToPlay()
                soundPlayer.volume = 1.0
        
        }
        catch let error as NSError {
                print("An error occurred: \(error)")
        }
    }
}
