//
//  MotionDataViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 01/12/21.
//

import CoreMotion
import UIKit

class MotionDataViewController: UIViewController {
    

    @IBOutlet weak var accX: UITextField!
    @IBOutlet weak var accY: UITextField!
    @IBOutlet weak var accZ: UITextField!
    
    @IBOutlet weak var gyroX: UITextField!
    @IBOutlet weak var gyroY: UITextField!
    @IBOutlet weak var gyroZ: UITextField!
    
    @IBOutlet weak var magnetX: UITextField!
    @IBOutlet weak var magnetY: UITextField!
    @IBOutlet weak var magnetZ: UITextField!
    
    
    // create CMMotionManager instance
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myAccelerometer()
        myGyroscope()
        myMagnetometer()
    }
    
    func myAccelerometer() {
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.current!) {(data, error) in
            print(data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y
                let z = trueData.acceleration.z
                self.accX.text = "x: \(Double(x).rounded(toPlaces: 3))"
                self.accY.text = "y: \(Double(y).rounded(toPlaces: 3))"
                self.accZ.text = "z: \(Double(z).rounded(toPlaces: 3))"
            }
        }
    }
    func myGyroscope() {
        manager.gyroUpdateInterval = 0.1
        manager.startGyroUpdates(to: OperationQueue.current!) {(data, error) in
            print(data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.rotationRate.x
                let y = trueData.rotationRate.y
                let z = trueData.rotationRate.z
                self.gyroX.text = "x: \(Double(x).rounded(toPlaces: 3))"
                self.gyroY.text = "y: \(Double(y).rounded(toPlaces: 3))"
                self.gyroZ.text = "z: \(Double(z).rounded(toPlaces: 3))"
            }
        }
    }
    func myMagnetometer() {
        manager.magnetometerUpdateInterval = 0.1
        manager.startMagnetometerUpdates(to: OperationQueue.current!) {(data, error) in
            print(data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.magneticField.x
                let y = trueData.magneticField.y
                let z = trueData.magneticField.z
                self.magnetX.text = "x: \(Double(x).rounded(toPlaces: 3))"
                self.magnetY.text = "y: \(Double(y).rounded(toPlaces: 3))"
                self.magnetZ.text = "z: \(Double(z).rounded(toPlaces: 3))"
            }
        }
    }
}
extension Double {
    //Round double to decimal value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
