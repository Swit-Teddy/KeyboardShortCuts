//
//  AppDelegate.swift
//  KeyCommandTest
//
//  Created by 이숭인 on 2022/01/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
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

    
    //MARK: - Menus
    
    var menuController: MenuController!
    
    @objc
    // User chose Open from the File menu.
    func openAction(_ sender: AnyObject) {
        Swift.debugPrint(#function)
    }
    
    @objc
    // User chose an item from the menu grouping of city titles.
    func citiesMenuAction(_ sender: AnyObject) {
        if let keyCommand = sender as? UIKeyCommand {
            if let identifier = keyCommand.propertyList as? [String: String] {
                if let value = identifier["city"] {
                    Swift.debugPrint("City command = \(String(describing: value))")
                }
            }
        }
    }
    
    @objc
    // User chose an item from the menu grouping of town titles.
    func townsMenuAction(_ sender: AnyObject) {
        if let command = sender as? UICommand {
            if let identifier = command.propertyList as? [String: String] {
                if let value = identifier["town"] {
                    Swift.debugPrint("Town command = \(value)")
                }
            }
        }
    }
    
    @objc
    // User chose an item from the menu grouping of city titles.
    func switMenuAction(_ sender: AnyObject) {
        if let keyCommand = sender as? UIKeyCommand {
            if let identifier = keyCommand.propertyList as? [String: String] {
                if let value = identifier["swit"] {
                    Swift.debugPrint("swit command = \(String(describing: value))")
                }
            }
        }
    }
    
    @objc
    // User chose an item from the Navigation menu of key commands or performed that key command.
    func navigationMenuAction(_ sender: AnyObject) {
        if let keyCommand = sender as? UIKeyCommand {
            if let identifier = keyCommand.propertyList as? [String: String] {
                if let value = identifier[MenuController.CommandPListKeys.ArrowsKeyIdentifier] {
                    Swift.debugPrint("Navigation command = \(value)")
                }
            }
        }
    }
    
    override func buildMenu(with builder: UIMenuBuilder) {
        /** First check if the builder object is using the main system menu, which is the main menu bar.
            To check if the builder is for a contextual menu, check for: UIMenuSystem.context.
         */
        if builder.system == .main {
            menuController = MenuController(with: builder)

        }
    }

}

