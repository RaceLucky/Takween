//
//  MoreController.swift
//  TkweenProject
//
//  Created by Galexy on 11/04/2022.
//

import UIKit

class MoreController: UIViewController  {
  
  @IBOutlet weak var viewContainer: UIView!
  @IBOutlet weak var moreTableView: UITableView!
  @IBOutlet weak var profileImageViewContainer: UIView!
  @IBOutlet weak var profileImageView: UIImageView!
  
  var moreData: [MoreOption] = [
    .profile,
    .products,
    .reservations,
    .orders
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
}

extension MoreController {
  
  private func initialSetup() {
    profileImageViewContainer.layer.cornerRadius = 47.5
    profileImageView.layer.cornerRadius = 47.5
    moreTableView.register(UINib(nibName: "MoreCell", bundle: nil), forCellReuseIdentifier: "MoreCell")
    viewContainer.layer.cornerRadius = 5
    configureprofileImageViewContainer()
  }
  
  private func configureprofileImageViewContainer() {
    profileImageViewContainer.layer.shadowColor = UIColor.gray.cgColor
    profileImageViewContainer.layer.shadowOffset = .zero
    profileImageViewContainer.layer.shadowOpacity = 0.3
    profileImageViewContainer.layer.shadowRadius = 6
  }
}

// MARK: - UITableViewDataSource

extension MoreController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    moreData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath) as! MoreCell
    moreCell.profileImageView.image = UIImage(named: moreData[indexPath.row].iconName)
    moreCell.profileNameLabel.text = moreData[indexPath.row].title
    return moreCell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}

// MARK: - UITableViewDelegate

extension MoreController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(moreData[indexPath.row])
  }
}
