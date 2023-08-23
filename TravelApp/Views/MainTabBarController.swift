//
//  MainTabBarController.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 21.08.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBar.appearance()
        
        //appearance.barTintColor = Color.turquoise.color
        appearance.tintColor = Color.turquoise.color
        appearance.backgroundColor = Color.lightGray.color

        let homeVC = HomeVC()
        let imageHome = UIImage(named: "homeLogo")
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: imageHome, tag: 0)
        
        let visitsVC = VisitsVC()
        let imageVisit = UIImage(named: "visitLogo")
        visitsVC.tabBarItem = UITabBarItem(title: "Visits", image: imageVisit, tag: 1)
        
        let mapVC = MapVC()
        let imageMap = UIImage(named: "mapLogo")
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: imageMap, tag: 2)
        
        let menuVC = MenuVC()
        let imageMenu = UIImage(named: "menuLogo")
        menuVC.tabBarItem = UITabBarItem(title: "Menu", image: imageMenu, tag: 3)
        
        self.viewControllers = [homeVC, visitsVC, mapVC, menuVC]
        
    }
    
}
