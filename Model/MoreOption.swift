//
//  Profile.swift
//  TkweenProject
//
//  Created by Galexy on 11/04/2022.
//

import UIKit

enum MoreOption {
  case profile
  case products
  case reservations
  case orders
}

extension MoreOption {
  
  var title: String {
    switch self {
    case .profile:
      return "Profile"
      
    case .products:
      return "Products"
      
    case .reservations:
      return "Reservations"
      
    case .orders:
      return "Orders"
    }
  }
  
  var iconName: String {
    switch self {
    case .profile:
      return "ic_profile"
      
    case .products:
      return "ic_product"
      
    case .reservations:
      return "ic_reservation"
      
    case .orders:
      return "ic_orders"
    }
  }
}

