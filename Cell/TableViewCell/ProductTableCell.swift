//
//  productCell.swift
//  TkweenProject
//
//  Created by Galexy on 15/04/2022.
//

import UIKit

class ProductTableCell: UITableViewCell {
  
  @IBOutlet weak var productCollectionView: UICollectionView!
  
  var product = [NewProduct(image: "ic_connection_pramod", title: "Special Banner", price: "50 SR"),
                  NewProduct(image: "ic_dummy", title: "Special Banner", price: "50 SR"),
                  NewProduct(image: "ic_dummy", title: "Special Banner", price: "50 SR"),
                  NewProduct(image: "ic_dummy", title: "Special Banner", price: "50 SR"),
                  NewProduct(image: "ic_dummy", title: "Special Banner", price: "50 SR"),
                  NewProduct(image: "ic_dummy", title: "Special Banner", price: "50 SR"),
                  NewProduct(image: "ic_dummy", title: "Special Banner", price: "50 SR"),]
  
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

extension ProductTableCell {
  
  private func configureProductCollectionView() {
    productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
    productCollectionView.dataSource = self
    productCollectionView.delegate = self
    productCollectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
  }
}

// MARK: - UICollectionViewDataSource

extension ProductTableCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return product.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let homeProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
    let productData = product[indexPath.row]
    homeProductCell.productImageView.image =  UIImage(named: productData.image) 
    homeProductCell.productNameLabel.text = productData.title
    homeProductCell.productCost.text = productData.price
    return homeProductCell
  }
}

// MARK: - UICollectionViewDelegate

extension ProductTableCell: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.completion?()
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductTableCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: 100, height: 125)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}
