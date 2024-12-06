//
//  GFFollowerItem.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 9/11/22.
//

import UIKit

protocol GFFollowerItemVCDelegate: AnyObject {
    func didTapGetFollower(user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
    
    weak var delegate: GFFollowerItemVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()

    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, count: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, count: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    
    override func actionTapped() {
        delegate.didTapGetFollower(user: user)
    }

}
