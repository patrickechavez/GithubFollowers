//
//  SearchViewModel.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 12/10/24.
//

import Foundation

class SearchViewModel {
    weak var coordinator: SearchCoordinator?
    
    init(coordinator: SearchCoordinator?) {
        self.coordinator = coordinator
    }
    
    func goToFollowerList(username: String) {
        coordinator?.goToFollowerList(username: username)
    }

}
