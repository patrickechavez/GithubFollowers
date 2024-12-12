//
//  SceneDelegate.swift
//  GithubFollowers
//
//  Created by John Patrick Echavez on 7/29/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
   
        guard let windowScene = (scene as? UIWindowScene) else { return }
    
        let navigationController = UINavigationController()
        appCordinator = AppCoordinator(navigationController: navigationController)
        appCordinator?.start()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
        
    }

    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }

}

