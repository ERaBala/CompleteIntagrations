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
            
        } }
    
}
