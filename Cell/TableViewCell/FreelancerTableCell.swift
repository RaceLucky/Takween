//
//  FreelancerTableCell.swift
//  TkweenProject
//
//  Created by Galexy on 18/04/2022.
//

import UIKit

class FreelancerTableCell: UITableViewCell {
  
  @IBOutlet weak var freelancerCollectionView: UICollectionView!
  
   var freelancerField = [Freelancer(image: "ic_connection_pramod", title: "Omer", rating: "4,5", ratingImage: "ic_star", completed: "80",                          completedImage: "ic_done"),
                          Freelancer(image: "ic_connection_pramod", title: "Ahmad", rating: "4,5", ratingImage: "ic_star", completed: "80", completedImage: "ic_done"),
                          Freelancer(image: "ic_connection_pramod", title: "Ahmad", rating: "4,5", ratingImage: "ic_star", completed: "80", completedImage: "ic_done"),
                          Freelancer(image: "ic_connection_pramod", title: "Ahmad", rating: "4,5", ratingImage: "ic_star", completed: "80", completedImage: "ic_done"),
                          Freelancer(image: "ic_connection_pramod", title: "Amar", rating: "4,5", ratingImage: "ic_star", completed: "80", completedImage: "ic_done"),
                          Freelancer(image: "ic_connection_pramod", title: "Nmer", rating: "4,5", ratingImage: "ic_star", completed: "80", completedImage: "ic_done"),]
                            
  var completion: (() -> ())?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureProductCollectionView()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
}

extension FreelancerTableCell {
  
  private func configureProductCollectionView() {
    freelancerCollectionView.register(UINib(nibName: "FreelancerCell", bundle: nil), forCellWithReuseIdentifier: "FreelancerCell")
    freelancerCollectionView.dataSource = self
    freelancerCollectionView.delegate = self
    freelancerCollectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
  }
}

// MARK: - UICollectionViewDataSource

extension FreelancerTableCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return freelancerField.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let freelancerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FreelancerCell", for: indexPath) as! FreelancerCell
    let freelancerData = freelancerField[indexPath.row]
    freelancerCell.personImageView.image =  UIImage(named: freelancerData.image)
    freelancerCell.ratingAndCompletedImageView.image =  UIImage(named: freelancerData.ratingImage)
    completion?()
    freelancerCell.ratingAndCompletedImageView.image =  UIImage(named: freelancerData.completedImage)
    freelancerCell.personNameLabel.text = freelancerData.title
    freelancerCell.ratingAndCompletedLabel.text = freelancerData.rating
    return freelancerCell
  }
}

// MARK: - UICollectionViewDelegate

extension FreelancerTableCell: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

      completion?()
    }
    
  }

// MARK: - UICollectionViewDelegateFlowLayout

extension FreelancerTableCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: 100, height: 125)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}
