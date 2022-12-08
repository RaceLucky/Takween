//
//  CategoryTableViewCell.swift
//  TkweenProject
//
//  Created by Galexy on 15/04/2022.
//

import UIKit

class CategoryTableCell: UITableViewCell {
  
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  
  var categoryField = [Category(image: "ic_connection_pramod", title: "Book Markes"),
                       Category(image: "ic_connection_pramod", title: "Games"),
                       Category(image: "ic_connection_pramod", title: "Cards"),
                       Category(image: "ic_connection_pramod", title: "C.V."),
                       Category(image: "ic_connection_pramod", title: "Presentation"),
                       Category(image: "ic_connection_pramod", title: "Fridge"),]
  
  var category: (() -> ())?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureCollectionView()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}

extension CategoryTableCell {
  
  private func configureCollectionView() {
    categoryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    categoryCollectionView.dataSource = self
    categoryCollectionView.delegate = self
    categoryCollectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
  }
}

// MARK: - UICollectionViewDataSource

extension CategoryTableCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    categoryField.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as!  CategoryCell
    let fields = categoryField[indexPath.row]
    categoryCell.categoryImageView.image = UIImage(named: fields.image)
    categoryCell.categoryTitleLabel.text = fields.title
    return categoryCell
  }
}

// MARK: - UICollectionViewDelegate

extension CategoryTableCell: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    category?()
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoryTableCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 58, height: 74)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 15
  }
}
