//
//  FollowerlistCoordinator.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 12/10/24.
//

import UIKit

class FollowerlistCoordinator: Coordinator {
    var navigationController: UINavigationController
    var username: String
    
    init(navigationController: UINavigationController, username: String) {
        self.navigationController    = navigationController
        self.username                = username
    }
    
    func start() {
        let viewModel                       = FollowerListViewModel(coordinator: self, username: username)
        let folowerListViewController       = FollowerListVC()
        folowerListViewController.viewModel = viewModel
        navigationController.pushViewController(folowerListViewController, animated: true)
    }
    
}
