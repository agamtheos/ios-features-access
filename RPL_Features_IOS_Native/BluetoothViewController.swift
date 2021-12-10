//
//  BluetoothViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 09/12/21.
//

import UIKit
import CoreBluetooth

class BluetoothViewController: UIViewController, CBCentralManagerDelegate {
    
    var manager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    private func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [NSObject : AnyObject], RSSI: NSNumber!) {
        print("Peripheral: \(peripheral)")
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        var conslMsg = ""
        switch(central.state) {
        case .poweredOff:
            conslMsg = "BLE is powered off"
            
        case .poweredOn:
            conslMsg = "BLE is powered on"
            manager.scanForPeripherals(withServices: nil, options: nil)
            
        case .resetting:
            conslMsg = "BLE is resetting"
            
        case .unauthorized:
            conslMsg = "BLE is unauthorized"
            
        case .unknown:
            conslMsg = "BLE is unknown"
            
        case .unsupported:
            conslMsg = "BLE is unsupported"
        }
        
        print("\(conslMsg)")
    }
}
