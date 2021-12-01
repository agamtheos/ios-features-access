//
//  NfcReaderViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 01/12/21.
//

import UIKit
import CoreNFC

class NfcReaderViewController: UIViewController, NFCNDEFReaderSessionDelegate  {

    @IBOutlet weak var NFCText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    var nfcSession: NFCNDEFReaderSession?
    var word = "None"
    
    @IBAction func ScanBtn(_ sender: Any) {
        nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.begin()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("The Session is Invalid: \(error.localizedDescription)")
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var result = ""
        for payload in messages[0].records{
            result += String.init(data: payload.payload.advanced(by: 3), encoding: .utf8) ?? "Format not supported"
        }
        DispatchQueue.main.async {
            self.NFCText.text = result
        }
    }
    
}
