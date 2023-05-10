//
//  AlarmViewController.swift
//  Dispatch_Practice
//
//  Created by 박민서 on 2023/05/10.
//

import UIKit
import UserNotifications

class AlarmViewController: UIViewController {
    @IBAction func AlarmAddTapped(_ sender: Any) {
        setAlarm(time: 3.0)
    }
    @IBOutlet weak var AlarmTableView: UITableView!
    
    let queue = DispatchQueue(label: "com.example.alarmQueue", attributes: .concurrent)
    //var alarmWorkItem: DispatchWorkItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        //requestAuthorizationForNotification()
        self.AlarmTableView.delegate = self
        self.AlarmTableView.dataSource = self
        
        let AlarmCell = UINib(nibName: "AlarmTableViewCell", bundle: nil)
        AlarmTableView.register(AlarmCell, forCellReuseIdentifier: "AlarmTableViewCell")
        
        setAlarm(time: 3.0)
    }
    
    /*
    func requestAuthorizationForNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("알림 권한 승인됨")
            } else {
                print("알림 권한 거부됨")
            }
        }
    } */
    
    func setAlarm(time: TimeInterval) {
            //alarmWorkItem?.cancel()
            let workItem = DispatchWorkItem {
                let notificationContent = UNMutableNotificationContent()
                notificationContent.title = "알람"
                notificationContent.body = "알람이 울렸습니다."
                print("??")
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: "alarm", content: notificationContent, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { error in
                    if error != nil {
                        print("알림 추가 중 오류 발생")
                    }
                }
            }
            //alarmWorkItem = workItem
            queue.asyncAfter(deadline: .now() + time, execute: workItem)
            print("추가됨")
        }
}

extension AlarmViewController : UITableViewDelegate {
    
}

