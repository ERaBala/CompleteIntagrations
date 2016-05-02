//
//  FBViewController.swift
//  CompleteIntagrations
//
//  Created by User on 02/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FBViewController: UIViewController,FBSDKLoginButtonDelegate
{
    
    @IBOutlet var btnFacebook: FBSDKLoginButton!
    @IBOutlet var ivUserProfileImage: UIImageView!
    @IBOutlet var lblName: UILabel!
//    @IBOutlet var ivUserProfileImage : FBSDKProfilePictureView!
    
    var loginView : FBSDKLoginButton = FBSDKLoginButton()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginView.delegate = self
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            performSegueWithIdentifier("unwindToViewOtherController", sender: self)
        }
        else
        {
            configureFacebook()
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureFacebook()
    {
        btnFacebook.readPermissions = ["public_profile", "email", "user_friends","gender","birthday","age_range"];
        btnFacebook.delegate = self
    }
    
/*    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
            let strFirstName: String = (result.objectForKey("first_name") as? String)!
            let strLastName: String = (result.objectForKey("last_name") as? String)!
            let strPictureURL: String = (result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as? String)!
            self.lblName.text = "Welcome, \(strFirstName) \(strLastName)"
            self.ivUserProfileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: strPictureURL)!)!)
            print("result \(result)")
            }
    }
    */
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        
        loginManager.logOut()
        ivUserProfileImage.image = nil
        lblName.text = "Logout"
        print("User Logged Out")

    }
    

   
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            print("Process error")
        }
        else if result.isCancelled {
            // Handle cancellations
             print("Handle cancellations")
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                 print("Do work")
            }
        }
    }
    

}
