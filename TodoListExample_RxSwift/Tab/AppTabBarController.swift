//
//  AppTabBarController.swift
//  TodoListExample_RxSwift
//
//  Created by 임현규 on 2022/11/14.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    let taskTab: UITabBarItem = {
        let tabBarItem = UITabBarItem(
            title: "Tasks",
            image: UIImage(systemName: "checkmark.circle.fill"),
            selectedImage: UIImage(systemName: "checkmark.circle.fill"))
        
        return tabBarItem
    }()
    
    let settingTab: UITabBarItem = {
        let tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape"))
        
        return tabBarItem
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
    }
}

// MARK: - Functions

extension AppTabBarController {
    func setting() {
        let taskVC = TaskViewController()
        let settingVC = SettingViewController()
        
        tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .white
        
        viewControllers = [taskVC, settingVC]
        
        self.selectedIndex = 0
        
        taskVC.tabBarItem = taskTab
        settingVC.tabBarItem = settingTab
    }
}
