//
//  GFRepoItemVC.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 9/10/22.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject {
    func didTapGithubProfile(user: User)
}

class GFRepoItemVC: GFItemInfoVC {
    
    weak var delegate: GFRepoItemVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()

    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, count: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, count: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }

    
    override func actionTapped() {
        delegate.didTapGithubProfile(user: user)
    }
}
