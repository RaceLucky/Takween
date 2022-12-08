//
//  SettingController.swift
//  TkweenProject
//
//  Created by Galexy on 20/04/2022.
//

import UIKit

class SettingController: UIViewController {
  
  @IBOutlet weak var settingTableViewContainer: UIView!
  @IBOutlet weak var settingTableView: UITableView!
  
  var setting: [SettingData] = [
    .language,
    .contactUs,
    .aboutUs,
    .privacyPolicy
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetUp()
  }
}

extension SettingController {
  
  private func initialSetUp() {
    settingTableViewContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    settingTableViewContainer.layer.cornerRadius = 20
    configureTableView()
    configurenavigationBar()
  }
  
  private func configureTableView() {
    settingTableView.dataSource = self
    settingTableView.delegate = self
    settingTableView.register(UINib(nibName: "SettingTableCell", bundle: nil), forCellReuseIdentifier: "SettingTableCell")
    settingTableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  }
  
  private func configurenavigationBar() {
    let settingLabel = UILabel()
    settingLabel.text = "    Setting"
    settingLabel.textColor = .white
    settingLabel.font = UIFont(name: "Segoe UI Bold", size: 16)
    settingLabel.sizeToFit()
    let navigationBar = UIBarButtonItem(customView: settingLabel)
    self.navigationItem.leftBarButtonItem = navigationBar
  }
}

//MARK: - UITableViewDataSource

extension SettingController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return setting.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let settingData = setting[indexPath.row]
    let settingTableCell = tableView.dequeueReusableCell(withIdentifier: "SettingTableCell", for: indexPath) as! SettingTableCell
    settingTableCell.iconImageView.image = UIImage(named: settingData.icon)
    settingTableCell.nameLabel.text = settingData.title
    return settingTableCell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
}

//MARK: - UITableViewDataSource

extension SettingController: UITableViewDelegate {
  
}
