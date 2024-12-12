//
//  FavoritesListCoordinator.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 12/11/24.
//

import UIKit

class FavoritesListCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = FavoritesListViewModel(coordinator: self)
        let favoritesListViewController = FavoritesListVC()
        favoritesListViewController.viewModel = viewModel
        navigationController.pushViewController(favoritesListViewController, animated: true)
    }
    
    func goToFollowersList(username: String) {
        let followersListCoordinator = FollowerlistCoordinator(navigationController: self.navigationController, username: username)
    }
}
