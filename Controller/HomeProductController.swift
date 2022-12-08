//
//  HomeProductController.swift
//  TkweenProject
//
//  Created by Galexy on 11/04/2022.
//

import UIKit

class HomeProductController: UIViewController {
  
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var textfieldContainerView: UIView!
  @IBOutlet weak var arrowImage: UIImageView!
  @IBOutlet weak var arrowImageFreelancer: UIImageView!
  @IBOutlet weak var arrowimageLeading: NSLayoutConstraint!
  @IBOutlet weak var freelancerarrowImageLeading: NSLayoutConstraint!
  @IBOutlet weak var productViewHeight: NSLayoutConstraint!
  @IBOutlet weak var freelancerViewHeight: NSLayoutConstraint!
  @IBOutlet weak var productView: UIView!
  @IBOutlet weak var freelancerTableViewContainer: UIView!
  @IBOutlet weak var productTableView: UITableView!
  @IBOutlet weak var freelancerTableView: UITableView!
  
  var expandedField = Expanded.freelancer
  
  var products = [ProductData(type: .newest, sectionTitle: "Newest"),
                  ProductData(type: .heigherRating, sectionTitle: "Heigher rating"),
                  ProductData(type: .category, sectionTitle: "Category"),
  ]
  
  var freelancers = [
    FreelancerData(type: .heigherRating, sectionTitle: "Heigher rating"),
    FreelancerData(type: .morecompletedProject, sectionTitle: "More Completed Projects"),
    FreelancerData(type: .category, sectionTitle: "Category"),
  ]
  
  let screen = UIScreen.main.bounds
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  @IBAction func productButton(_ sender: Any) {
    switch expandedField {
    case .product:
      productViewHeight.constant = 65.0
      freelancerViewHeight.constant = screen.height / 1.54
      arrowimageLeading.priority = UILayoutPriority(1000)
      freelancerarrowImageLeading.priority = UILayoutPriority(500)
      arrowImage.image = UIImage(named: "ic_right_arrow")
      arrowImageFreelancer.image = UIImage(named: "ic_down_arrow")
      expandedField = .freelancer
      
    case .freelancer:
      freelancerViewHeight.constant = 65.0
      productViewHeight.constant = screen.height / 1.54
      arrowimageLeading.priority = UILayoutPriority(100)
      freelancerarrowImageLeading.priority = UILayoutPriority(1000)
      arrowImage.image = UIImage(named: "ic_down_arrow")
      arrowImageFreelancer.image = UIImage(named: "ic_right_arrow")
      expandedField = .product
    }
  }
  
  @IBAction func freelancerButton(_ sender: Any) {
    switch expandedField {
    case .product:
      productViewHeight.constant = 65.0
      freelancerViewHeight.constant = screen.height / 1.54
      arrowimageLeading.priority = UILayoutPriority(1000)
      freelancerarrowImageLeading.priority = UILayoutPriority(500)
      arrowImage.image = UIImage(named: "ic_right_arrow")
      arrowImageFreelancer.image = UIImage(named: "ic_down_arrow")
      expandedField = .freelancer
      
    case .freelancer:
      freelancerViewHeight.constant = 65.0
      productViewHeight.constant = screen.height / 1.54
      arrowimageLeading.priority = UILayoutPriority(500)
      freelancerarrowImageLeading.priority = UILayoutPriority(1000)
      arrowImage.image = UIImage(named: "ic_down_arrow")
      arrowImageFreelancer.image = UIImage(named: "ic_right_arrow")
      expandedField = .product
    }
  }
}

extension HomeProductController {
  
  private func initialSetup() {
    textfieldContainerView.layer.cornerRadius = 18
    configureNavigation()
    configureSearchButton()
    configureProductView()
    configureTableView()
    configuretableViewContainer()
    configureExpanfFieldEnum()
  }
  
  private func configureExpanfFieldEnum() {
    
    switch expandedField {
    case .product:
      productViewHeight.constant = 65.0
      arrowImage.image = UIImage(named: "ic_right_arrow")
      
    case .freelancer:
      freelancerViewHeight.constant = screen.height - 300
      arrowImageFreelancer.image = UIImage(named: "ic_down_arrow")
      freelancerarrowImageLeading.priority = UILayoutPriority(500)
      productViewHeight.constant = 65.0
    }
  }
  
  private func configureProductView() {
    productView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    productView.layer.cornerRadius = 20
  }
  
  private func configureSearchButton() {
    searchButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    searchButton.layer.cornerRadius = 18
  }
  
  private func configureNavigation() {
    let image = UIImage(named: "ic_navigation_bell")
    let barButton = UIBarButtonItem(image: image, style: .plain, target: nil, action: #selector(navigationBell))
    self.navigationItem.rightBarButtonItem = barButton
    barButton.tintColor = .white
    
    let leftTitleLabel = UILabel()
    leftTitleLabel.text = "    Home"
    leftTitleLabel.font = UIFont(name: "Segoe UI Bold", size: 16)
    leftTitleLabel.textColor = .white
    leftTitleLabel.sizeToFit()
    let leftItem = UIBarButtonItem(customView: leftTitleLabel)
    self.navigationItem.leftBarButtonItem = leftItem
  }
  
  private func configureTableView() {
    productTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
    productTableView.register(UINib(nibName: "ProductTableCell", bundle: nil), forCellReuseIdentifier: "ProductTableCell")
    productTableView.register(UINib(nibName: "CategoryTableCell", bundle: nil), forCellReuseIdentifier: "CategoryTableCell")
    productTableView.register(UINib(nibName: "ProductHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProductHeaderView")
    
    freelancerTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 160, right: 0)
    freelancerTableView.register(UINib(nibName: "FreelancerTableCell", bundle: nil), forCellReuseIdentifier: "FreelancerTableCell")
    freelancerTableView.register(UINib(nibName: "FreelancerHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "FreelancerHeaderView")
    freelancerTableView.register(UINib(nibName: "CategoryTableCell", bundle: nil), forCellReuseIdentifier: "CategoryTableCell")
    
    freelancerTableView.dataSource = self
    freelancerTableView.delegate = self
  }
  
  private func configuretableViewContainer() {
    freelancerTableViewContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    freelancerTableViewContainer.layer.cornerRadius = 20
    freelancerTableViewContainer.layer.shadowColor = UIColor.gray.cgColor
    freelancerTableViewContainer.layer.shadowRadius = 10
    freelancerTableViewContainer.layer.shadowOffset = .init(width: -5, height: -5);    freelancerTableViewContainer.layer.shadowOpacity = 0.5
  }
  
  @objc func navigationBell() {
    
  }
}

// MARK: - UITableViewDataSource

extension HomeProductController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    if tableView == self.freelancerTableView {
      return freelancers.count
    } else {
      return products.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if tableView == self.freelancerTableView {
      
      let fields = freelancers[indexPath.section]
      
      switch fields.type {
      case .morecompletedProject, .heigherRating:
        let freelancerTableCell = tableView.dequeueReusableCell(withIdentifier: "FreelancerTableCell", for: indexPath) as! FreelancerTableCell
        freelancerTableCell.completion = { [weak self] in
          //          let storyboard = UIStoryboard(name: "HomeProductController", bundle: nil)
          //          let categoryController = storyboard.instantiateViewController(withIdentifier: "CategoriesController") as! CategoriesController
          //          self.navigationController?.pushViewController(categoryController, animated: true)
//          print(freelancerTableCell.freelancerField[indexPath.row])
        }
        return freelancerTableCell
        
      case .category:
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath) as! CategoryTableCell
        return categoryCell
      }
    } else {
      let product = products[indexPath.section]
      switch product.type {
        
      case .heigherRating, .newest:
        let productTableCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableCell", for: indexPath) as! ProductTableCell
        return productTableCell
        
      case .category:
        let categoryTableCell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath) as! CategoryTableCell
        return categoryTableCell
      }
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if tableView == self.freelancerTableView {
      let fields = freelancers[indexPath.section]
      switch fields.type {
        
      case .heigherRating, .morecompletedProject:
        return 135
        
      case .category:
        return 90
      }
    } else {
      let product = products[indexPath.section]
      switch product.type {
        
      case .heigherRating, .newest:
        return 135
        
      case .category:
        return 90
      }
    }
  }
}

// MARK: - UITableViewDelegate

extension HomeProductController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == self.freelancerTableView {
      print("FreelancerTableView")
    } else {
      print("ProductTableView")
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if tableView == self.freelancerTableView {
      let freelancerHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FreelancerHeaderView") as? FreelancerHeaderView
      freelancerHeaderView?.freelancerHeaderLabel.text = freelancers[section].sectionTitle
      return freelancerHeaderView
    } else {
      let productHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProductHeaderView") as? ProductHeaderView
      productHeaderView?.tableHeaderLabel.text = products[section].sectionTitle
      return productHeaderView
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if tableView == self.freelancerTableView {
      return 25
    } else {
      return 25
    }
  }
}
