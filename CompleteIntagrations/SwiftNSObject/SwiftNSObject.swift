//
//  SwiftNSObject.swift
//  CompleteIntagrations
//
//  Created by User on 03/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class SwiftNSObject: NSObject {

    struct NotificationKey {
        let title: String
        func dis() {
            print("****** \(title) *******")
            //        SwiftNSObject .NotificationKey (title: "NSObject Test") .dis()
        }
    }

    struct Aleart {
        var title: String
        var message: String
        var btnTitle: String
        
        func displayAleart() {
            
            let alert = UIAlertView()
            alert.title = title
            alert.message = message
            alert.addButtonWithTitle(btnTitle)
            alert.show()
            
            //      SwiftNSObject .Aleart(title:"aleart",message: "Please Check Connection, Problem in Login Try again",btnTitle: "ok") .displayAleart()
            
        } }
    
    
    
    struct AlertController {
        let title: String
        func dis() {
            let alert = UIAlertController(title: title,
                                          message: "User ERROR has logged in",
                                          preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)     // put in Were u want
        }
    }
}
