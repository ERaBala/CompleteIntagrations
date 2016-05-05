//
//  ViewController.swift
//  CompleteIntagrations
//
//  Created by User on 02/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func MapButton(sender: AnyObject) {
        
        let MapController = self.storyboard?.instantiateViewControllerWithIdentifier("MapControl") as! MapViewController
        MapController.lat = "13.0522327"
        MapController.lng = "80.2736188"
        self.navigationController?.pushViewController(MapController, animated: true)

    }

    
    @IBAction func GetAddrsButton(sender: AnyObject) {
        
        let MapController = self.storyboard?.instantiateViewControllerWithIdentifier("GetAddrsTabelView") as! GetAddressTableView
        self.navigationController?.pushViewController(MapController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSBundle.mainBundle().URLForResource("Data", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            print(object)
            if let dictionary = object as? [String: AnyObject] {
                print(dictionary)
                readJSONObject(dictionary)
            }
        } catch {
            print(error)
        }
    }

    
    func readJSONObject(object: [String: AnyObject]) {
        
/*        guard let lat = object["users.Latitude"] as? String,
            let lng = object["users.Longitude"] as? Float,
            let addr = object["users.Addresses"] as? [[String: AnyObject]] else { return }

        
        print(lat)
        print(lng)
        print(addr)
        
        
        guard let title = object["dataTitle"] as? String,
            let version = object["swiftVersion"] as? Float,
            let users = object["users"] as? [[String: AnyObject]] else { return }
        let swift = "Swift \(version) " + title
        print(swift)
        
        for user in users {
            guard let name = user["name"] as? String,
                let age = user["age"] as? Int else { break }
            switch age {
            case 22:
              let one = name + " is \(age) years old."
                print(one)
            case 25:
                let two = name + " is \(age) years old."
                print(two)
            case 29:
                let thre = name + " is \(age) years old."
                print(thre)
            default:
                break
            }
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

