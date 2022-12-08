//
//  FreelancerCell.swift
//  TkweenProject
//
//  Created by Galexy on 18/04/2022.
//

import UIKit

class FreelancerCell: UICollectionViewCell {

  @IBOutlet weak var ratingAndCompletedImageView: UIImageView!
  @IBOutlet weak var personNameLabel: UILabel!
  @IBOutlet weak var personImageView: UIImageView!
  @IBOutlet weak var ratingAndCompletedLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    initialSetup()
    }

}

extension FreelancerCell {
  
  private func initialSetup() {
    personImageView.layer.cornerRadius = 10
  }
}
