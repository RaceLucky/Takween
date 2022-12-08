//
//  SplashController.swift
//  TkweenProject
//
//  Created by Galexy on 11/04/2022.
//

import UIKit

class SplashController: UIViewController {
  
  @IBOutlet weak var pageControllerView: AdvancedPageControlView!
  @IBOutlet weak var onboardingCollectionView: UICollectionView!
  @IBOutlet weak var nextButton: UIButton!
  
  var slids = [Clips(image: "ic_message_one", message: "Message 1", description: "Description is the pattern of narrative development that aim to make vivid a place, object, character, or group. along with exposition, argumentation,"),
               Clips(image: "ic_message_two", message: "Message 2", description: "Description is the pattern of narrative development that aim to make vivid a place, object, character, or group, along with exposition, argumentation"),
               Clips(image: "ic_message_three", message: "Message 3", description: "Description is the pattern of narrative development that aim to make vivid a place, object, character, or group. along with exposition, argumentation")]
  
  var currentPage = 0 {
    didSet {
      if currentPage == slids.count  - 1 {
        nextButton.setTitle("Got it", for: .normal)
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        let splashController = storyboard.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
        self.navigationController?.pushViewController(splashController, animated: true)
      } else {
        nextButton.setTitle("Next", for: .normal)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    configureNextButton()
    configurepageController()
  }
  
  @IBAction func nextScreenButton(_ sender: Any) {
    if currentPage == slids.count - 1{
      print("Go to Next screen")
//      let storyboard = StoryboardScene.HomeController.instantiateViewController(withIdentifier: "HomeProductController")
//      self.navigationController?.pushViewController(storyboard, animated: true)
      let storyboard = UIStoryboard(name: "Account", bundle: nil)
      let resetPasswordController = storyboard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
      self.navigationController?.pushViewController(resetPasswordController, animated: true )
    } else {
      currentPage += 1
      let indexpath = IndexPath(item: currentPage, section: 0)
      onboardingCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
  }
}

extension SplashController {
  
  private func configureNextButton() {
    nextButton.layer.shadowRadius = 6
    nextButton.layer.shadowColor = UIColor.orange.cgColor
    nextButton.layer.shadowOffset = .zero
    nextButton.layer.shadowOpacity = 0.4
    nextButton.layer.cornerRadius = 22
  }
  
  private func configureCollectionView() {
    onboardingCollectionView.register(UINib(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCell")
    onboardingCollectionView.dataSource = self
    onboardingCollectionView.delegate = self
  }
  
  private func configurepageController() {
    pageControllerView.drawer = ExtendedDotDrawer()
    pageControllerView.drawer = ExtendedDotDrawer(numberOfPages: 3,
                                                  space: 10.0,
                                                  indicatorColor: UIColor.init(red: 212/255, green: 217/255, blue: 74/255, alpha: 1),
                                                  dotsColor: .systemGray6,
                                                  isBordered: true,
                                                  borderWidth: 8.0,
                                                  indicatorBorderColor: .orange,
                                                  indicatorBorderWidth: 10.0)
  }
}

// MARK: - UICollectionViewDataSource

extension SplashController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    slids.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let onboardingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
    onboardingCell.onboardingImageView.image = UIImage.init(named: slids[indexPath.row].image)
    onboardingCell.onboardingMessageLabel.text = slids[indexPath.row].message
    onboardingCell.onboardingDescriptionLabel.text = slids[indexPath.row].description
    return onboardingCell
  }
}

// MARK: - UICollectionViewDelegate

extension SplashController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(".User clicked on cell:-\n\(slids[indexPath.row])")
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SplashController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 390)
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offSet = scrollView.contentOffset.x
    let width = scrollView.frame.width
    pageControllerView.setPageOffset(offSet/width)
  }
}
