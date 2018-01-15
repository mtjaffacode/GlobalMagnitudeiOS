//
//  ViewController.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/11/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate var rootViewController: UIViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showSplashViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showSplashViewController() {
        if rootViewController is SplashViewController {
            return
        }
        
        rootViewController?.willMove(toParentViewController: nil)
        rootViewController?.removeFromParentViewController()
        rootViewController?.view.removeFromSuperview()
        rootViewController?.didMove(toParentViewController: nil)
        
        if let splashViewController = storyboard?.instantiateViewController(withIdentifier: "SplashViewController") {
            rootViewController = splashViewController
            
            splashViewController.willMove(toParentViewController: self)
            addChildViewController(splashViewController)
            view.addSubview(splashViewController.view)
            splashViewController.didMove(toParentViewController: self)
            
            delay(6.00) {
                self.showLeaderBoard()
            }
        }
    }
    
    func showLeaderBoard() {
        if let leaderBoardViewController = storyboard?.instantiateViewController(withIdentifier: "LeaderBoardViewController") {
            present(leaderBoardViewController, animated: true, completion: nil)
        }
    }
    
    public func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

}

