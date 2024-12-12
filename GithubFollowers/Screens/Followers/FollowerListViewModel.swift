//
//  FollowerListViewModel.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 12/10/24.
//

import Foundation

class FollowerListViewModel {
    weak var coordinator: FollowerlistCoordinator?
    var username: String
    
    
    init(coordinator: FollowerlistCoordinator, username: String) {
        self.coordinator = coordinator
        self.username = username
    }
    
    func getFollowers() {
        
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result  in
            guard let self  = self else { return }
            switch result {
            case .success(let followers): break;
            case .failure(let error): break;
                
            }
            
        }
    }

}
