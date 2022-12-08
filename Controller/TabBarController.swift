//
//  TabBarController.swift
//  TkweenProject
//
//  Created by Galexy on 11/04/2022.
//

import UIKit

class TabBarController: UITabBarController {
  
  // MARK:- Private Properties
  
  private var tabWidth: CGFloat {
    tabBar.frame.size.width / 4
  }
  
  // MARK:- LifeCycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
    setupStyle()
  }
  
  // MARK:- Private
  
  private func initialSetup() {
    self.delegate = self
    configureTabBar()
    addInitialControllers()
    bind()
  }
  
  private func configureTabBar() {
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage()
    setupStyle()
  }
  
  private func setupStyle() {
    tabBar.tintColor = .white
    tabBar.unselectedItemTintColor = .init(white: 1, alpha: 0.5)
    tabBar.backgroundColor = UIColor(red: 74/255, green: 176/255, blue: 217/255, alpha: 1)
  }
  
  private func addInitialControllers() {
    let homeVC = StoryboardScene.HomeController.instantiateViewController(withClass: HomeProductController.self)
    let homeNavigationController = navigationController(rootViewController: homeVC)
    
    let requestVC  = StoryboardScene.Request.instantiateViewController(withClass: CategoriesController.self)
    let requestNavigationController = navigationController(rootViewController: requestVC)
    
    let settingsVC = StoryboardScene.Settings.instantiateViewController(withClass: SettingController.self)
    let settingsNavigationController = navigationController(rootViewController: settingsVC)
    
    let  moreVC = StoryboardScene.More.instantiateViewController(withClass: MoreController.self)
    let moreNavigationController = navigationController(rootViewController: moreVC)
    
    viewControllers = [
      homeNavigationController,
      requestNavigationController,
      settingsNavigationController,
      moreNavigationController
    ]
    
    homeNavigationController.tabBarItem = UITabBarItem(
      title: nil,
      image: UIImage(named: "ic_profile_tabbar"),
      selectedImage: nil
    )
    
    requestNavigationController.tabBarItem = UITabBarItem(
      title: nil,
      image: UIImage(named: "ic_request_tabbar"),
      selectedImage: nil
    )

    settingsNavigationController.tabBarItem = UITabBarItem(
      title: nil,
      image: UIImage(named: "ic_setting_tabbar"),
      selectedImage: nil
    )

    moreNavigationController.tabBarItem = UITabBarItem(
      title: nil,
      image: UIImage(named: "ic_more_tabbar"),
     selectedImage: nil
    )
  }

  @objc private func scanCard() {
    routeToAddContact()
  }
}

// MARK:- UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    if viewController == viewControllers?[3] {
      sideMenuController?.showRightView()
      return false
    } else {
      return true
    }
  }
}

//MARK: - Bind Method

extension TabBarController {
  
  private func bind() {
    
  }
}

extension TabBarController {
  
  private func navigationController(rootViewController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: rootViewController)
    navigationController.navigationBar.isHidden = false
    navigationController.interactivePopGestureRecognizer?.isEnabled = true
    return navigationController
  }
}

// MARK: - Routing Methods

extension TabBarController {
  
  private func routeToAddContact() {
    
  }
}
