//
//  GPlusViewController.swift
//  CompleteIntagrations
//
//  Created by User on 02/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion
import Google

class GPlusViewController: UIViewController, GIDSignInUIDelegate  {

   
    @IBOutlet weak var SigninButton: GPPSignInButton!
    
    let clientId = "475506435724-2nkc4e2b3eckjdka46ohb5sg36u9tcth.apps.googleusercontent.com"
    var signIn:GPPSignIn?

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        
//        label.text = auth.userEmail
        print("login success \(auth.userEmail)")
        print("\(signIn?.googlePlusUser.displayName)")
        let cc = signIn?.googlePlusUser.name.familyName
        print("\(cc)")
        print(error)
  
    }
    
    
    
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }

    func didDisconnectWithError(error: NSError!) {
        print("connect fail")
    }

}