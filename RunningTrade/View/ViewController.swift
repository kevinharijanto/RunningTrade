//
//  ViewController.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 16/11/22.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .rtblue
//        UITabBar.appearance().barTintColor = .rtgray
//        tabBar.backgroundColor = .rtgray
//        tabBar.tintColor = .white
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        
        rootViewController.navigationItem.title = title
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .rtblue
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navController.navigationBar.standardAppearance = navBarAppearance
        
        return navController
    }
    
    @objc func handlePrint() {
        
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: RunningTradeViewController(), title: "WATCHLIST", image: UIImage(systemName: "binoculars.fill")!),
            createNavController(for: RunningTradeViewController(), title: "TOP STOCKS", image: UIImage(systemName: "trophy.fill")!),
            createNavController(for: RunningTradeViewController(), title: "RUNNING TRADE", image: UIImage(systemName: "arrow.up.right")!),
            createNavController(for: RunningTradeViewController(), title: "BUY/SELL", image: UIImage(systemName: "arrow.up.arrow.down")!),
            createNavController(for: RunningTradeViewController(), title: "ORDER STATUS", image: UIImage(systemName: "list.bullet.clipboard")!)
        ]
    }
}

