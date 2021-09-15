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
    
    var soundRecorder : AVAudioRecorder!
    var soundPlayer : AVAudioPlayer!
    var fileName = "audioFile.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        
    }
    
    func setupRecorder() {
        let recordSetts = [AVFormatIDKey : kAudioFormatAppleLossless,
                           AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
                           AVEncoderBitRateKey : 320000,
                           AVNumberOfChannelsKey : 2,
                           AVSampleRateKey : 44100.0] as [String : Any]
        do {
            if let soundRecorder = try? AVAudioRecorder(url: getFileURL() as URL, settings: recordSetts as [String : Any]){
                soundRecorder.delegate = self
                soundRecorder.prepareToRecord()
            }
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
    
    func getCacheDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        return paths[0] as NSString
    }
    
    func getFileURL() -> NSURL {
        let path = getCacheDirectory().appendingPathComponent(fileName)
        let filePath = NSURL(fileURLWithPath: path)
        return filePath
    }
    
    @IBAction func Record(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {
            soundRecorder.record()
            sender.setTitle("Stop", for:.normal)
            PlayBTN.isEnabled = false
        }
        else {
            soundRecorder.stop()
            sender.setTitle("Record", for: .normal)
            PlayBTN.isEnabled = false
        }
    }
    @IBAction func Play(_ sender: UIButton) {
        if sender.titleLabel?.text == "Play" {
            RecordBTN.isEnabled == false
            sender.setTitle("Stop", for: .normal)
            
            preparePlayer()
            soundPlayer.play()
        }else {
            soundPlayer.stop()
            sender.setTitle("Play", for: .normal)
        }
    }
    
    func preparePlayer() {
        var error : NSError?
        do {
            if let soundPlayer = try? AVAudioPlayer(contentsOf: getFileURL() as URL) {
                soundPlayer.delegate = self
                soundPlayer.prepareToPlay()
                soundPlayer.volume = 1.0
            }
        }
        catch let error as NSError {
                print("An error occurred: \(error)")
        }
    }
}
