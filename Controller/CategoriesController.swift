//
//  CategoriesController.swift
//  TkweenProject
//
//  Created by Galexy on 19/04/2022.
//

import UIKit

class CategoriesController: UIViewController {
  
  @IBOutlet weak var categoryTableView: UITableView!
  @IBOutlet weak var tableViewContainer: UIView!
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var textfieldContainerView: UIView!
  
  var categoriesData: [Categories] = [
    .banner,
    .card,
    .flyer,
    .logo,
    .magzine,
    .mindMap,
    .play,
    .post,
    .poster,
    .them
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
    
  }
}

extension CategoriesController {
  
  private func initialSetup() {
    textfieldContainerView.layer.cornerRadius = 18
    tableViewContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    tableViewContainer.layer.cornerRadius = 20
    configureNavigation()
    configureSearchButton()
    configureProductView()
    configureTableView()
    configureCollectionView()
  }
  
  private func configureProductView() {
    categoryCollectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    categoryCollectionView.layer.cornerRadius = 20
  }
  
  private func configureSearchButton() {
    searchButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    searchButton.layer.cornerRadius = 18
  }
  
  private func configureNavigation() {
    let image = UIImage(named: "ic_filter")
    let barButton = UIBarButtonItem(image: image, style: .plain, target: nil, action: #selector(navigationBell))
    self.navigationItem.rightBarButtonItem = barButton
    barButton.tintColor = .white
    
    let leftTitleLabel = UILabel()
    leftTitleLabel.text = "    Categories"
    leftTitleLabel.font = UIFont(name: "Segoe UI Bold", size: 16)
    leftTitleLabel.textColor = .white
    leftTitleLabel.sizeToFit()
    let leftItem = UIBarButtonItem(customView: leftTitleLabel)
    self.navigationItem.leftBarButtonItem = leftItem
  }
  
  private func configureTableView() {
    categoryTableView.dataSource = self
    categoryTableView.delegate = self
    categoryTableView.register(UINib(nibName: "CategoriesItemCell", bundle: nil), forCellReuseIdentifier: "CategoriesItemCell")
    categoryTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)

  }
  
  private func configureCollectionView() {
    categoryCollectionView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCell")
    categoryCollectionView.dataSource = self
    categoryCollectionView.delegate = self
    categoryCollectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 30)
  }
  
  @objc func navigationBell() {
    
  }
}

// MARK: - UICollectionViewDataSource

extension CategoriesController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoriesData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let categorryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
    categorryCell.categoryLabel.text = categoriesData[indexPath.row].title




    return categorryCell
  }
}

// MARK: - UICollectionViewDelegate

extension CategoriesController: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(categoriesData[indexPath.row])
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoriesController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 50, height: 40)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}

// MARK: - UITableViewDataSource

extension CategoriesController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 15
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let categoriesItemCell = tableView.dequeueReusableCell(withIdentifier: "CategoriesItemCell", for: indexPath) as! CategoriesItemCell
    return categoriesItemCell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 126
  }
}

// MARK: - UITableViewDelegate

extension CategoriesController: UITableViewDelegate {
  
}
