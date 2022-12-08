//
//  ResetPasswordController.swift
//  Pods
//
//  Created by Galexy on 12/04/2022.
//

import UIKit

class ResetPasswordController: UIViewController {

  @IBOutlet weak var bottomViewContainer: UIView!
  @IBOutlet weak var topViewContainer: UIView!
  @IBOutlet weak var sendButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  @IBAction func sendButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Account", bundle: nil)
    let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "VerificationController") as! VerificationController
    self.navigationController?.pushViewController(resetPasswordController, animated: true )
  }
}

extension ResetPasswordController {
  
  private func initialSetup() {
    configureSendButton()
    configureViewContainer()
  }
  
  private func configureSendButton() {
    sendButton.layer.cornerRadius = 20
    sendButton.layer.shadowColor = UIColor.orange.cgColor
    sendButton.layer.shadowRadius = 5
    sendButton.layer.shadowOffset = .zero
    sendButton.layer.shadowOpacity = 0.2
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

