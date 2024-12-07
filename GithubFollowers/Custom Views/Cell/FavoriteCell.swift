//
//  FavoriteCell.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 11/21/24.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let reuseUID = "FavoriteCell"
    let avatarImageView  = GFAvatarImageView(frame: .zero)
    let usernameLabel    = GFTitleLabel(textAlignment: .left, fontSize: 26)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower) {
        avatarImageView.downloadImage(url: favorite.avatarUrl)
        usernameLabel.text = favorite.login
    }
    
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        accessoryType            = .disclosureIndicator
        let padding: CGFloat     = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
    }
}

@available(iOS 17, *)
#Preview {
    let mockFavorite = Follower(login: "mockuser", avatarUrl: "https://avatars.githubusercontent.com/u/33833?v=4")
    let cell = FavoriteCell(style: .default, reuseIdentifier: FavoriteCell.reuseUID)
    cell.set(favorite: mockFavorite)
    return cell
}
