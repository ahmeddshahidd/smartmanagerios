//
//  SplashController.swift
//  MultipleStoryboard
//
//  Created by Faraz Haider on 03/01/2017.
//  Copyright © 2017 Ingic. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    @IBOutlet weak var imageViewSplash: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

      //  self.animateImages()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.changeRootViewController()
        
        // Do any additional setup after loading the view.
    }


    func animateImages(){

        let image = #imageLiteral(resourceName: "Splash")
        
        UIView.transition(with: self.imageViewSplash, duration: 0.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            self.imageViewSplash.image = image
        }) { (Bool) in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.changeRootViewController()
           
        };
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

}
