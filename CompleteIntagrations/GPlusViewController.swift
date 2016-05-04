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

class GPlusViewController: UIViewController, GPPSignInDelegate {

    @IBOutlet weak var btnGPlus: GPPSignInButton!
    
    let clientId = "475506435724-2nkc4e2b3eckjdka46ohb5sg36u9tcth.apps.googleusercontent.com"
    var signIn:GPPSignIn?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        signIn = GPPSignIn.sharedInstance()
        
        btnGPlus.style = kGPPSignInButtonStyleWide
        btnGPlus.colorScheme = kGPPSignInButtonColorSchemeDark
        
        
        signIn?.shouldFetchGooglePlusUser = true
        signIn?.shouldFetchGoogleUserID = true
        signIn?.shouldFetchGoogleUserEmail = true
        
        // You previously set kClientId in the "Initialize the Google+ client" step
        signIn?.clientID = clientId
        
        
        // Uncomment one of these two statements for the scope you chose in the previous step
        signIn?.scopes = [ kGTLAuthScopePlusLogin ];  // "https://www.googleapis.com/auth/plus.login" scope
        //signIn.scopes = @[ @"profile" ];            // "profile" scope
        
        // Optional: declare signIn.actions, see "app activities"
        signIn?.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
        signIn?.trySilentAuthentication()
        //signIn.authenticate()

          
        // Do any additional setup after loading the view.
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
    
    
    func googlePlusContactsCallback(ticket: GTLServiceTicket!, returnObject: AnyObject?, error: NSError!) {
        /*
         if(error != nil){
         print("\(error)")
         return
         }
         let res  = object as GTLSwiftsampleapiPostRes
         print("\(res.message) \(res.identifier) \(res.registeredAt) \(res.email)")*/
    }
    
    
    func didDisconnectWithError(error: NSError!) {
        print("connect fail")
    }

}