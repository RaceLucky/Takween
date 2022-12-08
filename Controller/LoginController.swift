//
//  AccountController.swift
//  TkweenProject
//
//  Created by Galexy on 12/04/2022.
//

import UIKit

class LoginController: UIViewController {
  
  @IBOutlet weak var bottomViewContainer: UIView!
  @IBOutlet weak var topViewContainer: UIView!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var logInButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  @IBAction func forgetPasswordButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Account", bundle: nil)
    let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "ResetPasswordController") as! ResetPasswordController
    self.navigationController?.pushViewController(resetPasswordController, animated: true )
  }
  
  @IBAction func signUpButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Account", bundle: nil)
    let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
    self.navigationController?.pushViewController(resetPasswordController, animated: true )
  }
}

extension LoginController {
  
  private func initialSetup() {     
    configurelogInButton()
    configureSignupButton()
    configureViewContainer()
  }
  
  private func configurelogInButton() {
    logInButton.layer.cornerRadius = 20
    logInButton.layer.shadowColor = UIColor.orange.cgColor
    logInButton.layer.shadowRadius = 5
    logInButton.layer.shadowOffset = .zero
    logInButton.layer.shadowOpacity = 0.2
  }
  
  private func configureSignupButton() {
    signUpButton.layer.cornerRadius = 20
    signUpButton.layer.borderWidth = 1
    signUpButton.layer.borderColor = UIColor.orange.cgColor
  }
  
  private func configureViewContainer() {
    topViewContainer.layer.shadowColor = UIColor.init(red: 216/255, green: 238/255, blue: 247/255, alpha: 1).cgColor
    topViewContainer.layer.shadowRadius = 10
    topViewContainer.layer.shadowOffset = .zero
    topViewContainer.layer.shadowOpacity = 1
    topViewContainer.layer.cornerRadius = 120.5
    bottomViewContainer.layer.cornerRadius = 81
    bottomViewContainer.layer.shadowColor = UIColor.init(red: 203/255, green: 204/255, blue: 178/255, alpha: 1).cgColor
    bottomViewContainer.layer.shadowOffset = .zero
    bottomViewContainer.layer.shadowRadius = 10
    bottomViewContainer.layer.shadowOpacity = 1
  }
}
