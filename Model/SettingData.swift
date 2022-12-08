//
//  File.swift
//  TkweenProject
//
//  Created by Galexy on 20/04/2022.
//

import Foundation

enum SettingData {
  
  case language
  case contactUs
  case aboutUs
  case privacyPolicy
}

extension SettingData {
  
  var title: String {
    switch self {
    case .language:
      return "Language"
      
    case .contactUs:
      return "Contact us"
      
    case .aboutUs:
      return "About us"
      
    case .privacyPolicy:
      return "Privacy & policy"
    }
  }
  var icon: String {
    switch self {
    case .language:
      return "ic_language"
      
    case .contactUs:
      return "ic_contact"
      
    case .aboutUs:
      return "ic_aboutus"
      
    case .privacyPolicy:
      return "ic_privacy"
    }
  }
}
