//
//  SignUpController.swift
//  TkweenProject
//
//  Created by Galexy on 12/04/2022.
//

import UIKit

class SignUpController: UIViewController {
  
  @IBOutlet weak var checkBoxViewContainer: UIView!
  @IBOutlet weak var signUpLabel: UILabel!
  @IBOutlet weak var signUPTableView: UITableView!
  @IBOutlet weak var bottomViewContainer: UIView!
  @IBOutlet weak var topViewContainer: UIView!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var logInButton: UIButton!
  
  var signUpFields = [
    SignUpField(text: "Full Name", image: "ic_user", textfieldPlaceHolder: "Name", isSecureTextField: false, value: "", fieldType: .fullName),
    SignUpField(text: "Phone Number", image: "ic_mobile", textfieldPlaceHolder: "Phone Number", isSecureTextField: false, value: "", fieldType: .phoneNumber),
    SignUpField(text: "Email", image: "ic_email", textfieldPlaceHolder: "Email", isSecureTextField: false, value: "", fieldType: .email),
    SignUpField(text: "Password", image: "ic_lock", textfieldPlaceHolder: "Password", isSecureTextField: true, value: "", fieldType: .password),
    SignUpField(text: "Confirm Password", image: "ic_lock", textfieldPlaceHolder: "Confirm Password", isSecureTextField: true, value: "", fieldType: .confirmPassword)
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  @IBAction func logInButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Account", bundle: nil)
    let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
    self.navigationController?.pushViewController(resetPasswordController, animated: true )
  }
}

extension SignUpController {
  
  private func initialSetup() {
    configurelogInButton()
    configureSignupButton()
    configureViewContainer()
    configureSignUPTableView()
    congigureCheckBoxContainer()
  }
  
  private func  configureSignupButton() {
    signUpButton.layer.cornerRadius = 20
    signUpButton.layer.shadowColor = UIColor.orange.cgColor
    signUpButton.layer.shadowRadius = 5
    signUpButton.layer.shadowOffset = .zero
    signUpButton.layer.shadowOpacity = 0.2
  }
  
  private func configurelogInButton() {
    logInButton.layer.cornerRadius = 20
    logInButton.layer.borderWidth = 1
    logInButton.layer.borderColor = UIColor.orange.cgColor
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
  
  private func configureSignUPTableView() {
    signUPTableView.register(UINib(nibName: "SignUpCell", bundle: nil), forCellReuseIdentifier: "SignUpCell")
    signUPTableView.register(UINib(nibName: "NumberViewCell", bundle: nil), forCellReuseIdentifier: "NumberViewCell")
    signUPTableView.tableHeaderView = signUpLabel
  }
  
  private func congigureCheckBoxContainer() {
    checkBoxViewContainer.layer.borderColor = UIColor.black.cgColor
    checkBoxViewContainer.layer.borderWidth = 1
    checkBoxViewContainer.layer.cornerRadius = 5
  }
}

// MARK: - UITableViewDataSource

extension SignUpController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    signUpFields.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let field = signUpFields[indexPath.row]
    
    switch field.fieldType {
    case .phoneNumber:
      let numberViewCell = tableView.dequeueReusableCell(withIdentifier: "NumberViewCell", for: indexPath) as! NumberViewCell
      signUPTableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
      return numberViewCell
      
    case .fullName, .email, .password, .confirmPassword:
      let signUpCell = tableView.dequeueReusableCell(withIdentifier: "SignUpCell", for: indexPath) as! SignUpCell
      signUpCell.detailtextLabel.text = field.text
      signUpCell.detailImageView.image = UIImage(named: field.image)
      signUpCell.textFieldPlaceHolder.placeholder = field.text
      signUpCell.textFieldPlaceHolder.isSecureTextEntry = field.isSecureTextField
      signUPTableView.separatorInset = UIEdgeInsets(top: 0, left: 42, bottom: 0, right: 0)
      return signUpCell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 75
  }
}

// MARK: - UITableViewDelegate

extension SignUpController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(signUpFields[indexPath.row])
  }
}
