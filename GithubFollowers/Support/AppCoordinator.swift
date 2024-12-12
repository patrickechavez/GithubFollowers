//
//  AppCoordinator.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 12/10/24.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        Search()
    }
    

    private func Search() {
        let searchCoordinator = SearchCoordinator(navigationController: self.navigationController)
        searchCoordinator.start()
        
    }
    
    private func Followers() {
    }
    
    
}
