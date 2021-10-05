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
         
         let tabViewController = MainTabBarController()
         tabViewController.items = [mainViewController, favoriteViewController]
         tabViewController.tabBar.backgroundColor = .systemBackground
         return tabViewController
     }
 }
 
