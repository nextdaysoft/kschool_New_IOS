//
//  AppDelegate.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 15/12/25.
//

import UIKit
import SDWebImage
import LanguageManager_iOS
var globalLanguage: String = "en"
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
  
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SDImageCodersManager.shared.addCoder(SDImageGIFCoder.shared)
        NotificationCenter.default.addObserver(self, selector: #selector(updateAppLanguage), name: NSNotification.Name("LanguageChanged"), object: nil)
        NetworkMonitor.shared.startMonitoring()
        setLanguageByUser()
        
        return true
    }

    func setLanguageByUser() {
        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"
        switch selectedLanguage {
        case "ar":
            LanguageManager.shared.defaultLanguage = .ar
            LanguageManager.shared.setLanguage(language: .ar)
            globalLanguage = "ar"
            AppLanguage.shared.set(index: .arabic)
        case "es":
            LanguageManager.shared.defaultLanguage = .es
            LanguageManager.shared.setLanguage(language: .es)
            globalLanguage = "es"
            AppLanguage.shared.set(index: .spanish)
        case "zhHans":
            LanguageManager.shared.defaultLanguage = .zhHans
            LanguageManager.shared.setLanguage(language: .zhHans)
            globalLanguage = "zhHans"
            AppLanguage.shared.set(index: .chinese)
        case "ru":
            LanguageManager.shared.defaultLanguage = .ru
            LanguageManager.shared.setLanguage(language: .ru)
            globalLanguage = "ru"
            AppLanguage.shared.set(index: .russian)
        case "sv":
            LanguageManager.shared.defaultLanguage = .sv
            LanguageManager.shared.setLanguage(language: .sv)
            globalLanguage = "sv"
            AppLanguage.shared.set(index: .swedish)
        case "pl":
            LanguageManager.shared.defaultLanguage = .pl
            LanguageManager.shared.setLanguage(language: .pl)
            globalLanguage = "pl"
            AppLanguage.shared.set(index: .polish)
        case "ja":
            LanguageManager.shared.defaultLanguage = .ja
            LanguageManager.shared.setLanguage(language: .ja)
            globalLanguage = "ja"
            AppLanguage.shared.set(index: .polish)
        case "it":
            LanguageManager.shared.defaultLanguage = .it
            LanguageManager.shared.setLanguage(language: .it)
            globalLanguage = "it"
            AppLanguage.shared.set(index: .italian)
        case "de":
            LanguageManager.shared.defaultLanguage = .de
            LanguageManager.shared.setLanguage(language: .de)
            globalLanguage = "de"
            AppLanguage.shared.set(index: .german)
        case "nl":
            LanguageManager.shared.defaultLanguage = .nl
            LanguageManager.shared.setLanguage(language: .nl)
            globalLanguage = "nl"
            AppLanguage.shared.set(index: .dutch)
        case "da":
            LanguageManager.shared.defaultLanguage = .da
            LanguageManager.shared.setLanguage(language: .da)
            globalLanguage = "da"
            AppLanguage.shared.set(index: .danish)
        case "cs":
            LanguageManager.shared.defaultLanguage = .cs
            LanguageManager.shared.setLanguage(language: .cs)
            globalLanguage = "cs"
            AppLanguage.shared.set(index: .czech)
        case "ptPT":
            LanguageManager.shared.defaultLanguage = .ptPT
            LanguageManager.shared.setLanguage(language: .ptPT)
            globalLanguage = "ptPT"
            AppLanguage.shared.set(index: .portuguese)
            
        default:
            LanguageManager.shared.defaultLanguage = .en
            LanguageManager.shared.setLanguage(language: .en)
            globalLanguage = "en"
            AppLanguage.shared.set(index: .english)
        }
    }

    @objc func updateAppLanguage() {
        if let rootViewController = window?.rootViewController {
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            window?.makeKeyAndVisible()
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("LanguageChanged"), object: nil)
    }

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

