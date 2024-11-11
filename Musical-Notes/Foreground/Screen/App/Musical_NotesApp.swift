//
//  Musical_NotesApp.swift
//  Musical-Notes
//
//  Created by Jisoo Ham on 9/19/24.
//

import SwiftUI

import Firebase
import FirebaseMessaging

@main
struct Musical_NotesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        
        // 원격 알림
        UNUserNotificationCenter.current().delegate = self
        
        let authOption: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOption,
            completionHandler: {_, _ in }
        )
        
        application.registerForRemoteNotifications()
        
        // 메세지 대리자
        Messaging.messaging().delegate = self
        
        return true
    }
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // FCM 메시지의 데이터 페이로드 처리
        if let messageID = userInfo["gcm.message_id"] {
            print("Message ID: \(messageID)")
        }
        
        // userInfo를 통해 알림 데이터 처리
        print("Received remote notification: \(userInfo)")
        
        // 데이터를 성공적으로 처리한 후 완료 핸들러 호출
        completionHandler(.newData)
    }
    
}
extension AppDelegate: UNUserNotificationCenterDelegate {
    // APNS 등록 성공 시 호출되는 메서드
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // APNS 토큰을 Firebase에 전달
        Messaging.messaging().apnsToken = deviceToken
        print("APNS token registered: \(deviceToken)")
    }
    
    // APNS 등록 실패 시 호출되는 메서드
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error.localizedDescription)")
    }
}
// FCM
extension AppDelegate: MessagingDelegate {
    // 현재 등록 토큰 가져오기(device마다의 고유한 토큰 정보)
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
        // 현재 등록 토큰 가져오기
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
            }
        }
        
        // 토큰 모니터링 코드 - 변경되면
        print("Firebase registration token: \(String(describing: fcmToken))")
        
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
    }
}

