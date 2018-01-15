//
//  SplashViewController.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/12/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var outerRippleView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setupViewsForRippleEffect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViewsForRippleEffect(){
        outerRippleView.layer.zPosition = 1111
        self.outerRippleView.layer.cornerRadius = self.outerRippleView.frame.size.width / 2;
        self.outerRippleView.clipsToBounds = true
        self.outerRippleView.layer.borderColor = UIColor.lightertBlue().cgColor
        self.outerRippleView.layer.borderWidth = 1.0
        animateRippleEffect()
    }
    
    func animateRippleEffect(){
        self.outerRippleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        UIView.animate(withDuration: 1.5, delay: 0,
                       options: UIViewAnimationOptions.curveLinear,
                                   animations: {
                                    self.outerRippleView.transform = CGAffineTransform(scaleX: 11.0, y: 11.0)
        }, completion: { finished in
            self.animateRippleEffect()
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
}
