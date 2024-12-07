//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 8/29/22.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseUID = "FollowerCell"
    let avatarImageView  = GFAvatarImageView(frame: .zero)
    let usernameLabel    = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(url: follower.avatarUrl)
    }
    

    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        let padding:CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
     
}

@available(iOS 17, *)
#Preview {
    let mockFollower = Follower(login: "mockuser", avatarUrl: "https://avatars.githubusercontent.com/u/33833?v=4")
    let cell = FavoriteCell(style: .default, reuseIdentifier: FavoriteCell.reuseUID)
    cell.set(favorite: mockFollower)
    return cell
}
