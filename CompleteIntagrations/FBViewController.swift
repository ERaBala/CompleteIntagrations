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
    
    var loginView : FBSDKLoginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SwiftNSObject .NotificationKey (title: "NSObject Test") .dis()
        
        navigationController?.navigationBar.translucent = false
        navigationItem.title = "Facebook Login"

        self.loginView.delegate = self
        self.btnFacebook.delegate = self
        
        btnFacebook.center = self.view.center;
        
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        
/*       Any Problem in Facebook SDK Make use of this code. and command the FetchProfile() Methode.
         
         FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
            let strFirstName: String = (result.objectForKey("first_name") as? String)!
            let strLastName: String = (result.objectForKey("last_name") as? String)!
            let strPictureURL: String = (result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as? String)!
            self.lblName.text = "Welcome, \(strFirstName) \(strLastName)"
            self.ivUserProfileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: strPictureURL)!)!)
            print("result \(result)")
            }
*/
        fetchProfile()
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        
        loginManager.logOut()
        ivUserProfileImage.image = UIImage(named: "Profile_Pic.jpg")
        lblName.text = "Logout"
        print("User Logged Out")

    }
    

    
    func fetchProfile() {
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler({ (connection, user, requestError) -> Void in
            
            if requestError != nil {
                print(requestError)

                SwiftNSObject .Aleart(title:"aleart",message: "Please Check Connection, Problem in Login Try again",btnTitle: "ok") .displayAleart()
                
                return
            }
            
            let email = user["email"] as? String
            let firstName = user["first_name"] as? String
            let lastName = user["last_name"] as? String
            
            self.lblName.text = "\(firstName!) \(lastName!)"
            print(email)
            var pictureUrl = ""
            
            if let picture = user["picture"] as? NSDictionary, data = picture["data"] as? NSDictionary, url = data["url"] as? String {
                pictureUrl = url
            }
            
            let url = NSURL(string: pictureUrl)
            NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error)
                    return
                }
                
                let image = UIImage(data: data!)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.ivUserProfileImage.image = image
                })
                
            }).resume()
            
        })
    }
    

}
