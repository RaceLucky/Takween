//
//  FreelancerData.swift
//  TkweenProject
//
//  Created by Galexy on 18/04/2022.
//

import Foundation

class FreelancerData {
  
  var type: FreelancerField
  var sectionTitle: String
  
  init(type: FreelancerField, sectionTitle: String) {
    self.type = type
    self.sectionTitle = sectionTitle
  }
}
