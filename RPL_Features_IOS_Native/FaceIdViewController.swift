//
//  FaceIdViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 30/11/21.
//

import LocalAuthentication
import UIKit

class FaceIdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func TouchUpInside(_ sender: Any) {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Please Authorize with Face ID!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                
                DispatchQueue.main.async {
                    guard success, error == nil else{
                        //failed
                        let alert = UIAlertController(title: "Failed to Authenticate", message: "Please try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                        self?.present(alert, animated: true)
                        return
                    }
                    //show other screen
                    //success
                    let viewc = UIViewController()
                    viewc.title = "Welcome!"
                    viewc.view.backgroundColor = .systemBlue
                    self?.present(UINavigationController(rootViewController: viewc), animated: true, completion: nil)
                }
            }
        }
        else{
            // can't use
            
        }
    }
}
