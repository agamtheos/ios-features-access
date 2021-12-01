//
//  MotionDataViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 01/12/21.
//

import CoreMotion
import UIKit

class MotionDataViewController: UIViewController {
    
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    
    // create CMMotionManager instance
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Read the most recent accelerometer value
        motionManager.accelerometerData?.acceleration.x
        motionManager.accelerometerData?.acceleration.y
        motionManager.accelerometerData?.acceleration.z

        // How frequently to read accelerometer updates, in seconds
        motionManager.accelerometerUpdateInterval = 0.1

        // Start accelerometer updates on a specific thread
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            // Handle acceleration update
        }
    }
}
