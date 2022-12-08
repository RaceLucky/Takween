//
//  CategoryCell.swift
//  TkweenProject
//
//  Created by Galexy on 14/04/2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
  
  @IBOutlet weak var categoryImageView: UIImageView!
  @IBOutlet weak var categoryTitleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initalSetup()
  }
}

extension CategoryCell {
  
  private func initalSetup() {
    categoryImageView.layer.cornerRadius = 29
  }
}
