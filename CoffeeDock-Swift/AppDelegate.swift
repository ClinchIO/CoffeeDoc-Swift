//
//  AppDelegate.swift
//  CoffeeDock-Swift
//
//  Created by Damien Glancy on 17/03/2015.
//  Copyright (c) 2015 Clinch, Ltd. All rights reserved.
//

import UIKit
import ClinchKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    registerForPushNotifications()
    
    ClinchKit.enableLogging()
    ClinchKit.setDelegate(delegate: self)
    ClinchKit.registerUser(email: "sarah@example.com")
    ClinchKit.enableBeaconSupport()
    
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
    if application.applicationState != UIApplicationState.Active {
      ClinchKit.showApplicationForm(job: nil)
    }
  }
}

extension AppDelegate {
  func registerForPushNotifications() {
    let types = UIUserNotificationType.Badge | UIUserNotificationType.Alert | UIUserNotificationType.Sound;
    let settings = UIUserNotificationSettings(forTypes: types, categories: nil);
    UIApplication.sharedApplication().registerUserNotificationSettings(settings);
    UIApplication.sharedApplication().registerForRemoteNotifications();
  }
}

extension AppDelegate: ClinchKitDelegate {
  func userDidLeaveRegion(user: String, beacon: Beacon) {
    let notification = UILocalNotification()
    notification.fireDate = NSDate(timeIntervalSinceNow: 10)
    notification.alertBody = "Love CofeeDock? Like to work with us? Tap to apply to our open Barista position."
    notification.timeZone = NSTimeZone.defaultTimeZone()
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
  }
}