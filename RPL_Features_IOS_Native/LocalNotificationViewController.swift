//
//  LocalNotificationViewController.swift
//  RPL_Features_IOS_Native
//
//  Created by Agam Theos on 10/12/21.
//

import UIKit
import UserNotifications

class LocalNotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // ask permission user
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options:  [.alert, .sound]) {
            (granted, error) in
        }
        
        //create content notif
        let content = UNMutableNotificationContent()
        content.title = "This is Notification!"
        content.body = "It's work dude!"
        
        //trigger notif
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //create req
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //reg request
        center.add(request) { (error) in
            //handle error  
        }
    }
    

}
