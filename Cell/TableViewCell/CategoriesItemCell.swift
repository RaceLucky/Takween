//
//  CategoriesItemCell.swift
//  TkweenProject
//
//  Created by Galexy on 20/04/2022.
//

import UIKit

class CategoriesItemCell: UITableViewCell {
  
  @IBOutlet weak var categoryRatingLabel: UILabel!
  @IBOutlet weak var categoryDoneLabel: UILabel!
  @IBOutlet weak var categoryNameLabel: UILabel!
  @IBOutlet weak var categoryOtherNameLabel: UILabel!
  @IBOutlet weak var CategoryImageView: UIImageView!
  @IBOutlet weak var CategoryRatingImageView: UIImageView!
  @IBOutlet weak var CategoryDoneImageView: UIImageView!
  @IBOutlet weak var tableCellContainerView: UIView!
  

    override func awakeFromNib() {
       super.awakeFromNib()
       initialSetUp()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CategoriesItemCell {
  
  private func initialSetUp() {
    configureCategoryLabel()
    configureCategoryImage()
    configureContainerView()
  }
  
  private func configureCategoryLabel() {
    
  }
  
  private func configureCategoryImage() {
    CategoryImageView.layer.cornerRadius = 15
  }
  
  private func configureContainerView() {
    tableCellContainerView.layer.shadowColor = UIColor.gray.cgColor
    tableCellContainerView.layer.shadowOffset = .init(width: 0, height: 5)
    tableCellContainerView.layer.shadowRadius = 10
    tableCellContainerView.layer.shadowOpacity = 0.2
    tableCellContainerView.layer.cornerRadius = 20
  }
}
