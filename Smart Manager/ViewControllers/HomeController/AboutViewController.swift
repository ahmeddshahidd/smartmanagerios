//
//  AboutViewController.swift
//  Template
//
//  Created by alijabbar on 3/20/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
import SwiftWebVC

enum AboutMenu: Int {
    case rate = 0
    case like
    case web
}


class AboutViewController: BaseController {

    @IBOutlet var tableView: UITableView!
    
    let menuArray = [
        ["icon":"star_icon", "title":"Rate Engima App"],
        ["icon":"like_icon", "title":"Like us on Facebook"],
        ["icon":"web_icon", "title":"enigma.ae"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigationBarItem()
        self.title = "About"
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
    func navigateToController(_ menu: AboutMenu) {
        
        switch menu {
            
        case .rate:
            openAppPage()
            break
            
        case .like:
            openFacebookPage()
            break
            
        case .web:
            let webVC = SwiftWebVC(urlString: "https://www.enigma.ae/")
            self.navigationController?.pushViewController(webVC, animated: true)
        }
    }
    
    
    func openFacebookPage() {
        let url = "fb://profile/871093956282183"
        if UIApplication.shared.canOpenURL(NSURL(string: url)! as URL) {
            UIApplication.shared.open(NSURL(string: url)! as URL, options: [:], completionHandler: nil)
        } else {
            let webVC = SwiftWebVC(urlString: "https://www.facebook.com/EnigmaDubai")
            self.navigationController?.pushViewController(webVC, animated: true)
        }
    }
    
    func openAppPage() {
        let appID = "1192758791"

        UIApplication.tryURL(urls: [
            "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appID)&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8", // App
            ])
    }
}

extension AboutViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SideMenuTableViewCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let menu = AboutMenu(rawValue: indexPath.row) {
            self.navigateToController(menu)
        }

    }
    
}

extension AboutViewController : UITableViewDataSource {
    
    
    
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
