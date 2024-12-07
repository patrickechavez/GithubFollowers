//
//  GFTabBarController.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 11/22/24.
// 

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //configureTabBarAppearance()
        UITabBar.appearance().tintColor  = .systemGreen
        viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
    func configureTabBarAppearance() {
        UITabBar.appearance().tintColor  = .systemGreen
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesListVC()
        favoritesVC.title = "Search"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}

@available(iOS 17, *)
#Preview {
    GFTabBarController()
}
