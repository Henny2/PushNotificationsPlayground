//
//  ContentView.swift
//  PushNotificationsPlayground
//
//  Created by Henrieke Baunack on 1/15/24.
//

import SwiftUI
import UserNotifications

// source: https://www.youtube.com/watch?v=XnnDHDlPwLw

struct ContentView: View {
    var body: some View {
        VStack{
            Button("Request permission"){
                // requesting authorization to send notifications
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("we are all set")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule notification"){
                // make content
                let content  = UNMutableNotificationContent()
                content.title = "Feed the dogs"
                content.subtitle = "They are hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    ContentView()
}
