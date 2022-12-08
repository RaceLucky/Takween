//
//  ViewController.swift
//  OnboardingProject
//
//  Created by Galexy on 07/04/2022.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func forgetPasswordButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Account", bundle: nil)
    let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
    self.navigationController?.pushViewController(resetPasswordController, animated: true )
  }
}
