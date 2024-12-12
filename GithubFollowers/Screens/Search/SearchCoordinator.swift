//
//  SearchCoordinator.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 12/10/24.
//

import UIKit

class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel                    = SearchViewModel(coordinator: self)
        let searchViewController         = SearchVC()
        searchViewController.viewModel   = viewModel
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
    func goToFollowerList(username: String) {
        let followerListCoordinator = FollowerlistCoordinator(navigationController: self.navigationController, username: username)
        followerListCoordinator.start()
    }
    
}
