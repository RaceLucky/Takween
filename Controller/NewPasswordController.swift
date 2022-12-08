//
//  NewPasswordController.swift
//  TkweenProject
//
//  Created by Galexy on 12/04/2022.
//

import UIKit

class NewPasswordController: UIViewController {
  
  @IBOutlet weak var bottomViewContainer: UIView!
  @IBOutlet weak var topViewContainer: UIView!
  @IBOutlet weak var updateButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  @IBAction func updateButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Account", bundle: nil)
    let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
    self.navigationController?.pushViewController(resetPasswordController, animated: true )
  }
}

extension NewPasswordController {
  
  private func initialSetup() {
    configureSendButton()
    configureViewContainer()
  }
  
  private func configureSendButton() {
    updateButton.layer.cornerRadius = 20
    updateButton.layer.shadowColor = UIColor.orange.cgColor
    updateButton.layer.shadowRadius = 5
    updateButton.layer.shadowOffset = .zero
    updateButton.layer.shadowOpacity = 0.2
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

