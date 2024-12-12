//
//  FavoritesViewModel.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 12/11/24.
//

import Foundation

class FavoritesListViewModel {
    weak var coordinator: FavoritesListCoordinator?
    
    init(coordinator: FavoritesListCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func goToFollowersList(username: String) {
        coordinator?.goToFollowersList(username: username)
    }
    
}
