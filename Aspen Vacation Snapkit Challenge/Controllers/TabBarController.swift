//
//  TabBarController.swift
//  Aspen Vacation Snapkit Challenge
//
//  Created by Almat Alibekov on 01.11.2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        self.tabBar.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        self.tabBar.layer.cornerRadius = 32
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne = MainPageViewController()
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
                
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = SecondaryPageViewController()
        let tabTwoBarItem = UITabBarItem(title: "Tab 2", image: UIImage(systemName: "snowflake.circle"), selectedImage: UIImage(systemName: "snowflake.circle.fill"))
                
        tabTwo.tabBarItem = tabTwoBarItem
        
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
