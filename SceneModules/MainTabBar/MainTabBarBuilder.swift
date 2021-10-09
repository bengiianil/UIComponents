//
//  MainTabBarBuilder.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

 class MainTabBarBuilder {
     
     class func build() -> UIViewController {
                 
         let mainViewController = MainViewBuilder.build()
         let favoriteViewController = FavoriteViewBuilder.build()
         let tutorialViewController = TutorialViewBuilder.build()
         
         let jumper = FirstPageViewController()
         let jumperViewController = UINavigationController(rootViewController: jumper)
         jumper.title = "Jumper"
         jumper.tabBarItem.image = TabBarImages.bug.value
         jumper.tabBarItem.selectedImage = TabBarImages.bugSelected.value
         
         
         let tabViewController = MainTabBarController()
         tabViewController.viewControllers = [mainViewController, favoriteViewController, jumperViewController]
         tabViewController.tabBar.backgroundColor = .systemBackground
         tabViewController.tabBar.tintColor = .black
         return tabViewController
     }
 }
 
