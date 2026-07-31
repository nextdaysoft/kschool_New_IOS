//
//  SceneDelegate.swift
//  Kids
//
//  Created by NextDay Sotware Solution on 15/12/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let hasSelectedLanguage = UserDefaults.standard.bool(forKey: "hasSelectedLanguage")
        let hasOnboarded = UserDefaults.standard.bool(forKey: "hasOnboarded")
        let isProfileCompleted = UserDefaults.standard.bool(forKey: "isProfileCompleted")
        
        var rootVC: UIViewController
        
        if !hasSelectedLanguage {
            rootVC = storyboard.instantiateViewController(withIdentifier: "SelectLanguageVC")
            
        } else if !hasOnboarded {
            rootVC = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController")
            
        } else if !isProfileCompleted {
            rootVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC")
            
        } else {
            rootVC = storyboard.instantiateViewController(withIdentifier: "HomeScreen")
        }
        
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

enum Languages {
    case english, arabic, french, spanish, chinese, russian, swedish, polish, japanese, italian, german, dutch, danish, czech, portuguese, assamese
}

class AppLanguage {
    
    static let shared = AppLanguage()
    private init() { }
    
    var bundle: Bundle?
    
    func set(index: Languages) {
        switch index {
        case .english:
            // For English Language set LTR
            selectBundleForResource(forResource: "en", isRTL: false)
        case .arabic:
            // For RTL Language set RTL
            selectBundleForResource(forResource: "ar", isRTL: true)
        case .spanish:
            selectBundleForResource(forResource: "es", isRTL: false)
        case .chinese:
            selectBundleForResource(forResource: "zh", isRTL: false)
        case .russian:
            selectBundleForResource(forResource: "ru", isRTL: false)
        case .swedish:
            selectBundleForResource(forResource: "sv", isRTL: false)
        case .polish:
            selectBundleForResource(forResource: "pl", isRTL: false)
        case .japanese:
            selectBundleForResource(forResource: "ja", isRTL: false)
        case .italian:
            selectBundleForResource(forResource: "it", isRTL: false)
        case .german:
            selectBundleForResource(forResource: "de", isRTL: false)
        case .dutch:
            selectBundleForResource(forResource: "nl", isRTL: false)
        case .danish:
            selectBundleForResource(forResource: "da", isRTL: false)
        case .czech:
            selectBundleForResource(forResource: "cs", isRTL: false)
        case .portuguese:
            selectBundleForResource(forResource: "Portugal", isRTL: false)
        default:
            // For French Language set LTR
            selectBundleForResource(forResource: "fr", isRTL: false)
        }
        
    }
    
    private func selectBundleForResource(forResource: String!, isRTL: Bool) {
        guard let path = Bundle.main.path(forResource: forResource, ofType: "lproj") else {
            return
        }
        self.bundle = Bundle.init(path: path)
        switchViewControllers(isRTL: isRTL)
    }
    
    private func setKeyWindowFromAppDelegate(isRTL: Bool) {
        UIView.appearance().semanticContentAttribute = isRTL ? .forceRightToLeft : .forceLeftToRight
        let appDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        let homeViewController = UIViewController() // Replace with your root view controller.
        appDelegate?.window?.rootViewController = homeViewController
    }
    
    private func switchViewControllers(isRTL rtl : Bool){
        if rtl {
            setKeyWindowFromAppDelegate(isRTL: true)
        } else {
            setKeyWindowFromAppDelegate(isRTL: false)
        }
    }
}

public extension String {
    /// Return Localized String
    var localizedString : String {
        get {
            return self.toLocal()
        }
    }
}

private extension String {
    func toLocal() -> String {
        if AppLanguage.shared.bundle != nil {
            return NSLocalizedString(self, tableName: "Localizable", bundle: AppLanguage.shared.bundle!, value: "", comment: "")
        }
        return self
    }
}
