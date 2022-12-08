//
//  Category.swift
//  TkweenProject
//
//  Created by Galexy on 19/04/2022.
//

import Foundation
import UIKit

enum Categories {
  
  case logo
  case card
  case banner
  case them
  case poster
  case post
  case flyer
  case magzine
  case mindMap
  case play
}

extension Categories {
  var title: String {
    switch self {
    case .logo:
      return "Logo"
    case .card:
      return "Card"
    case .banner:
      return "Banner"
    case .them:
      return "Them"
    case .poster:
      return "Poster"
    case .post:
      return "Post"
    case .flyer:
      return "Flyer"
    case .magzine:
      return "Magzine"
    case .mindMap:
      return "MindMap"
    case .play:
      return "Play"
    }
  }
}
