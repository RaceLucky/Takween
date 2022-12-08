//
//  VerificationController.swift
//  TkweenProject
//
//  Created by Galexy on 12/04/2022.
//

import UIKit

class VerificationController: UIViewController {

  @IBOutlet weak var bottomViewContainer: UIView!
  @IBOutlet weak var topViewContainer: UIView!
  @IBOutlet weak var textFieldContainerOne: UIView!
  @IBOutlet weak var textFieldContainerTwo: UIView!
  @IBOutlet weak var textFieldContainerThree: UIView!
  @IBOutlet weak var textFieldContainerFour: UIView!
  @IBOutlet weak var verifyButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  @IBAction func sendButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Account", bundle: nil)
    let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "NewPasswordController") as! NewPasswordController
    self.navigationController?.pushViewController(resetPasswordController, animated: true )
  }
}

extension VerificationController {
  
  private func initialSetup() {
    configureSendButton()
    configureViewContainer()
    configuretextFieldContainer()
    configuretextFieldContainer()
  }
  
  private func configureSendButton() {
    verifyButton.layer.cornerRadius = 20
    verifyButton.layer.shadowColor = UIColor.orange.cgColor
    verifyButton.layer.shadowRadius = 5
    verifyButton.layer.shadowOffset = .zero
    verifyButton.layer.shadowOpacity = 0.2
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
  
  private func configuretextFieldContainer() {
    
    // textFieldContainerOne
    
    textFieldContainerOne.layer.cornerRadius = 8
    textFieldContainerOne.layer.shadowColor = UIColor.gray.cgColor
    textFieldContainerOne.layer.shadowOffset = .init(width: 0, height: 5)
    textFieldContainerOne.layer.shadowRadius = 5
    textFieldContainerOne.layer.shadowOpacity = 0.3
    
    // textFieldContainerTwo
    
    textFieldContainerTwo.layer.cornerRadius = 8
    textFieldContainerTwo.layer.shadowColor = UIColor.gray.cgColor
    textFieldContainerTwo.layer.shadowOffset = .init(width: 0, height: 5)
    textFieldContainerOne.layer.shadowRadius = 5
    textFieldContainerTwo.layer.shadowOpacity = 0.3
    
    // textFieldContainerThree
    
    textFieldContainerThree.layer.cornerRadius = 8
    textFieldContainerThree.layer.shadowColor = UIColor.gray.cgColor
    textFieldContainerThree.layer.shadowOffset = .init(width: 0, height: 5)
    textFieldContainerThree.layer.shadowRadius = 5
    textFieldContainerThree.layer.shadowOpacity = 0.3
    
    // textFieldContainerFour
    
    textFieldContainerFour.layer.cornerRadius = 8
    textFieldContainerFour.layer.shadowColor = UIColor.gray.cgColor
    textFieldContainerFour.layer.shadowOffset = .init(width: 0, height: 5)
    textFieldContainerFour.layer.shadowRadius = 5
    textFieldContainerFour.layer.shadowOpacity = 0.3
  }
}

