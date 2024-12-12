//
//  FavoritesListVC.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 7/29/22.
//

import UIKit

class FavoritesListVC: GFDataLoadingVC {
    
    var viewModel: FavoritesListViewModel!
    
    let tableView                = UITableView()
    var favorites: [Follower]    = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configure() {
        view.backgroundColor = .systemBackground
        title                = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame      = view.bounds
        tableView.rowHeight  = 80
        tableView.delegate   = self
        tableView.dataSource = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseUID)
    
    }
    
    func getFavorites() {
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                self.updateUI(with: favorites)
            case .failure(let error):
                self.presentGFAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func updateUI(with favorites: [Follower]) {
        
        if favorites.isEmpty {
            showEmptyStateView(message: "No Favorites?\nAdd one on the follower screen.", view: view)
        } else {
            self.favorites = favorites
            DispatchQueue.main.async { self.tableView.reloadData() }
            view.bringSubviewToFront(self.tableView)
        }
    }
    
}

extension FavoritesListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell     = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseUID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite     = favorites[indexPath.row]
        viewModel.goToFollowersList(username: favorite.login)
        //let destVC       = FollowerListVC(username: favorite.login)
        
        //navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
            }
            self.presentGFAlert(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
            
        }
        
    }
}
