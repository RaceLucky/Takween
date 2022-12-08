//
//  SignUpTextField.swift
//  TkweenProject
//
//  Created by Galexy on 13/04/2022.
//

import Foundation

class SignUpField {
  
  var text: String
  var image: String
  var textfieldPlaceHolder: String
  var isSecureTextField: Bool
  var value: String
  var fieldType: SignupFieldType
  
  init(text: String, image: String, textfieldPlaceHolder: String, isSecureTextField: Bool, value: String, fieldType: SignupFieldType) {
    self.text = text
    self.image = image
    self.textfieldPlaceHolder = textfieldPlaceHolder
    self.isSecureTextField = isSecureTextField
    self.value = value
    self.fieldType = fieldType
  }
}
