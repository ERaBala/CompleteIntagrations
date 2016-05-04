//
//  TwitterViewController.swift
//  CompleteIntagrations
//
//  Created by User on 02/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit


class TwitterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.translucent = false
        navigationItem.title = "Twitter Login"
        
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
/*                let alert = UIAlertController(title: "Logged In",
                    message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)  */
                print(unwrappedSession.userID)
                print(unwrappedSession.userName)
                
                let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TWTNextView") as! twtNextViewController
                secondViewController.myStringValue = "Welcome \(unwrappedSession.userName)"
                self.navigationController?.pushViewController(secondViewController, animated: true)
                
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
            // TODO: Base this Tweet ID on some data from elsewhere in your app

        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
