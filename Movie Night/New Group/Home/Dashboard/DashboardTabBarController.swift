//
//  DashboardTabBarController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/25/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    
    // MARK: - Props
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarUI()
    }
    
    // MARK: - Class Methods
    
    private func setupTabBarController() {
        viewControllers = createTabBarControllers()
    }
    
    private func setupTabBarUI() {
        tabBar.tintColor = .white
        tabBar.barStyle = .black
    }
    
    private func createTabBarControllers() -> [UINavigationController] {
        // MovieHomeController
        let movieHomeController = createNavigationController(with: MovieHomeController(), tabBarButtonImage: #imageLiteral(resourceName: "Movie"), tabBarButtonTitle: "Movies")
        
        // TVHomeController
        let tvHomeController = createNavigationController(with: UIViewController(), tabBarButtonImage: #imageLiteral(resourceName: "Television"), tabBarButtonTitle: "TV")
        
        // FavoritesHomeController
        let favoritesHomeController = createNavigationController(with: UIViewController(), tabBarButtonImage: #imageLiteral(resourceName: "heart"), tabBarButtonTitle: "Favorites")
        
        // SearchHomeController
        let searchHomeController = createNavigationController(with: UIViewController(), tabBarButtonImage: #imageLiteral(resourceName: "Search"), tabBarButtonTitle: "Search")
        
        return [
            movieHomeController,
            tvHomeController,
            favoritesHomeController,
            searchHomeController
        ]
    }
    
    private func createNavigationController(with rootController: UIViewController, tabBarButtonImage: UIImage, tabBarButtonTitle: String) -> UINavigationController {
        let controller = rootController
        let navController = MNNavigationController(rootViewController: controller)
        navController.tabBarItem.selectedImage = tabBarButtonImage
        navController.tabBarItem.image = tabBarButtonImage
        navController.tabBarItem.title = tabBarButtonTitle
        return navController
    }
    
}

// MARK: - UITabBar Delegate Extension

extension DashboardTabBarController: UITabBarControllerDelegate {
}
