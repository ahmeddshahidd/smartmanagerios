//
//  SideMenuController.swift
//  Template
//
//  Created by alijabbar on 3/18/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit


enum Menu: Int {
    case home = 0
    case serviceTracker
    case settings
    case support
    case about
}


class SideMenuController: UIViewController {
    
    private let kTableHeaderHeight: CGFloat = 300.0

    @IBOutlet var tableView: UITableView!
    
    var headerView: UIView!
    
    var aboutController:BaseNavigationController!
    var homeController:BaseNavigationController!
    
    let menuArray = [
        ["icon":"home_icon", "title":"Home"],
        ["icon":"service_icon", "title":"Servive Tracker"],
        ["icon":"settigns_icon", "title":"Settings"],
        ["icon":"support_icon", "title":"Support"],
        ["icon":"about_icon", "title":"About Enigma"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        
        
        setupControllers()
        
        
    }
    
    func setupControllers() {
        
        let homeVC:HomeController = AppStoryboard.Home.instance.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        self.homeController = BaseNavigationController(rootViewController: homeVC)
        
        let aboutVC:AboutViewController = AppStoryboard.Home.instance.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        self.aboutController = BaseNavigationController(rootViewController: aboutVC)
        
    }
    
    func setupTableView() {
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0 )
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateHeaderView()
    }
    
    func updateHeaderView() {
    
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func changeViewController(_ menu: Menu) {
        
        switch menu {
            
        case .home:
            self.slideMenuController()?.changeMainViewController(self.homeController, close: true)
        case .serviceTracker:
            self.slideMenuController()?.changeMainViewController(self.aboutController, close: true)
        case .settings:
            self.slideMenuController()?.changeMainViewController(self.aboutController, close: true)
        case .support:
            self.slideMenuController()?.changeMainViewController(self.aboutController, close: true)
        case .about:
            self.slideMenuController()?.changeMainViewController(self.aboutController, close: true)
        }
    }
}

extension SideMenuController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}

extension SideMenuController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SideMenuTableViewCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let menu = Menu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
}

extension SideMenuController : UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell") as! SideMenuTableViewCell
        
        cell.iconImageView.image = UIImage(named:menuArray[indexPath.row]["icon"]!)
        cell.titleLabel.text = menuArray[indexPath.row]["title"]
        
        return cell
    }
    
    
}







