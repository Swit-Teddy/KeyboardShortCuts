//
//  MenuController.swift
//  KeyCommandTest
//
//  Created by 이숭인 on 2022/01/20.
//

import UIKit

class MenuController {
    init(with builder: UIMenuBuilder){
        builder.remove(menu: .format)
        
        builder.insertSibling(MenuController.citiesMenu2(), beforeMenu: .window)
        builder.insertSibling(MenuController.switMenu(), beforeMenu: .window)
        builder.insertSibling(MenuController.navigationMenu(), beforeMenu: .window)
        
        builder.insertChild(MenuController.openMenu(), atEndOfMenu: .citiesMenu)
    }
    
    struct CommandPListKeys {
        static let ArrowsKeyIdentifier = "id" // Arrow command-keys
        static let CitiesKeyIdentifier = "city" // City command-keys
        static let TownsIdentifierKey = "town" // Town commands
        static let StylesIdentifierKey = "font" // Font style commands
        static let ToolsIdentifierKey = "tool" // Tool commands
    }
    
    enum Arrows: String, CaseIterable {
        case rightArrow
        case leftArrow
        case upArrow
        case downArrow
        func localizedString() -> String {
            return NSLocalizedString("\(self.rawValue)", comment: "")
        }
    }
    
    class func openMenu() -> UIMenu {
        let openCommand =
            UIKeyCommand(title: NSLocalizedString("OpenTitle", comment: ""),
                         image: nil,
                         action: #selector(AppDelegate.openAction),
                         input: "o",
                         modifierFlags: .command)
        let openMenu =
            UIMenu(title: "",
                   image: nil,
                   identifier: .openMenu,
                   options: .displayInline,
                   children: [openCommand])
        return openMenu
    }
    
    class func citiesMenu2() -> UIMenu {
        // Create the Cities menu group.
        let cities = ["a","b","c","d","e"]
        
        let cityChildrenCommands = zip(cities, 0...).map { (city, index) in
            UIKeyCommand(title: city,
                         image: nil,
                         action: #selector(AppDelegate.citiesMenuAction(_:)), // AppDelegare responds to this key command.
                         input: String(index),
                         modifierFlags: .command,
                         propertyList: ["city": city])
        }
        let citiesMenuGroup = UIMenu(title: "",
                                     image: nil,
                                     identifier: .citiesGroupMenu,
                                     options: .displayInline,
                                     children: cityChildrenCommands)
        
        return UIMenu(title: NSLocalizedString("TestMenuTitle", comment: ""),
                      image: nil,
                      identifier: .citiesMenu,
                      options: [],
                      children: [citiesMenuGroup])
    }
    
    class func navigationMenu() -> UIMenu {
        let keyCommands = [ UIKeyCommand.inputRightArrow,
                            UIKeyCommand.inputLeftArrow,
                            UIKeyCommand.inputUpArrow,
                            UIKeyCommand.inputDownArrow ]
        let arrows = Arrows.allCases
        
        let arrowKeyChildrenCommands = zip(keyCommands, arrows).map { (command, arrow) in
            UIKeyCommand(title: arrow.localizedString(),
                         image: nil,
                         action: #selector(AppDelegate.navigationMenuAction(_:)),
                         input: command,
                         modifierFlags: .command,
                         propertyList: [CommandPListKeys.ArrowsKeyIdentifier: arrow.rawValue])
        }
        
        let arrowKeysGroup = UIMenu(title: "",
                      image: nil,
                      identifier: .arrowsMenu,
                      options: .displayInline,
                      children: arrowKeyChildrenCommands)
        
        return UIMenu(title: NSLocalizedString("NavigationTitle", comment: ""),
                      image: nil,
                      identifier: .navMenu,
                      options: [],
                      children: [arrowKeysGroup])
    }
    
    class func switMenu() -> UIMenu {
        // Create the Cities menu group.
        let names = ["ha","ke","ch","al","zo","te","aa","bb","cc","dd","eee","ff","ww","uuu","aaa","bbb","zcccc","adsadse"]
        let switChildrenCommands = zip(names, 0...).map { (city, index) in
            UIKeyCommand(title: city,
                         image: nil,
                         action: #selector(AppDelegate.switMenuAction(_:)), // AppDelegare responds to this key command.
                         input: "\(String(index))q",
                         modifierFlags: .command,
                         propertyList: ["swit": city])
        }
        let switMenuGroup = UIMenu(title: "",
                                     image: nil,
                                     identifier: .switGroupMenu,
                                     options: .displayInline,
                                     children: switChildrenCommands)
       
        
        return UIMenu(title: NSLocalizedString("SwitMenuTitle", comment: ""),
                      image: nil,
                      identifier: .switMenu,
                      options: [],
                      children: [switMenuGroup])
    }
}


extension UIMenu.Identifier {
    static var newMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.newMenu") }
    
    static var openMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.openMenu") }
   
    static var testMenu: UIMenu.Identifier {
        UIMenu.Identifier("com.example.swit-samplecode.teddy.testMenu")
    }
    
    static var citiesMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.citiesMenu") }
    static var citiesGroupMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.citiesSubMenu") }
    static var townsGroupMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.townsSubMenu") }
    
    static var switMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.swit.menu-test.teddy.switMenu") }
    
    static var switGroupMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.swit.menu-test.teddy.switGroupMenu") }
    
    static var navMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.navigationMenu") }
    static var arrowsMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.arrowKeysSubMenu") }
    static var styleMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.fontStylesMenu") }
    static var toolsMenu: UIMenu.Identifier { UIMenu.Identifier("com.example.apple-samplecode.menus.toolsMenu") }
}
