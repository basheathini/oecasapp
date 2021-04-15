import UIKit
import Flutter
import Firebase
import GoogleMaps
import FirebaseAuth

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyAYqzxLq4vA387KgOniRU5Y4uRXJQ9Fykg")

    if #available(iOS 10.0, *) {

      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: {_, _ in })
    } else {
      let settings: UIUserNotificationSettings =
      UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }

    application.registerForRemoteNotifications()
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    let firebaseAuth = Auth.auth()
    if (firebaseAuth.canHandleNotification(userInfo)){
        return
    }
}

func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
  let firebaseAuth = Auth.auth()
  firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.prod)

}
