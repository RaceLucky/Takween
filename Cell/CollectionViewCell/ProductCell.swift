//
//  HomeProductCell.swift
//  TkweenProject
//
//  Created by Galexy on 14/04/2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
  
  @IBOutlet weak var productCost: UILabel!
  @IBOutlet weak var userViewContainer: UIView!
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initialSetUP()
  }
}

extension ProductCell {
  
  private func initialSetUP() {
    userViewContainer.layer.cornerRadius = 10
    userViewContainer.layer.shadowColor = UIColor.gray.cgColor
    userViewContainer.layer.shadowRadius = 5
    userViewContainer.layer.shadowOffset = .zero
    userViewContainer.layer.shadowOpacity = 0.4
    productImageView.layer.cornerRadius = 15
  }
}
