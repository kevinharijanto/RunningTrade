//
//  TabBar.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 18/11/22.
//

import UIKit
class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .rtgray
        tabBar.tintColor = .white
        UITabBar.appearance().barTintColor = .rtgray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let tabOne = TabOneViewController()
        let tabOneBarItem = UITabBarItem(title: "Tab 1",
                                         image: UIImage(systemName: "binoculars")!,
                                         selectedImage: UIImage(systemName: "binoculars.fill")!)
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = TabTwoViewController()
        let tabTwoBarItem = UITabBarItem(title: "Tab 2",
                                         image: UIImage(systemName: "trophy"),
                                         selectedImage: UIImage(systemName: "trophy.fill"))
        tabTwo.tabBarItem = tabTwoBarItem
    
        let tabRT = UINavigationController(rootViewController: RunningTradeViewController())
//        let tabRT = RunningTradeViewController()
        let tabRTBarItem = UITabBarItem(title: "Running Trade",
                                        image: UIImage(systemName: "arrow.up.right.circle"),
                                        selectedImage: UIImage(systemName: "arrow.up.right.circle.fill"))
        tabRT.tabBarItem = tabRTBarItem
        
        let tabThree = TabThreeViewController()
        let tabThreeBarItem = UITabBarItem(title: "Tab 3",
                                           image: UIImage(systemName: "arrow.up.arrow.down.circle"),
                                           selectedImage: UIImage(systemName: "arrow.up.arrow.down.circle.fill"))
        tabThree.tabBarItem = tabThreeBarItem
        
        let tabFour = TabFourViewController()
        let tabFourBarItem = UITabBarItem(title: "Tab 3",
                                          image: UIImage(systemName: "list.bullet.clipboard"),
                                          selectedImage: UIImage(systemName: "list.bullet.clipboard.fill"))
        tabFour.tabBarItem = tabFourBarItem
        
        self.viewControllers = [tabRT, tabOne, tabTwo, tabThree, tabFour]
    }
}
