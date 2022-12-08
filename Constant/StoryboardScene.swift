//
//  StoryboardScene.swift
//
//

import Foundation
import UIKit

class StoryboardScene {
  
  static let Main: UIStoryboard = {
    return UIStoryboard(name: "Main", bundle: nil)
  }()
  
  static let HomeController: UIStoryboard = {
    return UIStoryboard(name: "HomeProductController", bundle: nil)
  }()
  
  static let Request: UIStoryboard = {
    return UIStoryboard(name: "HomeProductController", bundle: nil)
  }()
  
  static let Settings: UIStoryboard = {
    return UIStoryboard(name: "Settings", bundle: nil)
  }()
  
  static let More: UIStoryboard = {
    return UIStoryboard(name: "More", bundle: nil)
  }()
}

extension UIStoryboard {
  
  func controllerExists(withIdentifier: String) -> Bool {
    if let availableIdentifiers = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
      return availableIdentifiers[withIdentifier] != nil
    }
    
    return false
  }
  
  func instantiateViewController<VC: UIViewController>(withClass: VC.Type) -> VC {
    let identifier = NSStringFromClass(withClass as AnyClass).components(separatedBy: ".")[1]
    guard controllerExists(withIdentifier: identifier) else {
      fatalError("Failed to instantiate viewController")
    }
    
    return instantiateViewController(withIdentifier: identifier) as! VC
  }
}
