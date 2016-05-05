//
//  GetAddressTableView.swift
//  CompleteIntagrations
//
//  Created by User on 05/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class GetAddressTableView: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    var latitude = [String]()
    var longitude = [Float]()
    var address = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSBundle.mainBundle().URLForResource("Data", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                print(dictionary)
                readJSONObject(dictionary)
            }
        } catch {
            print(error)
        }
    }
    
    func readJSONObject(object: [String: AnyObject]) {
        
//        guard let lat = object["users.Latitude"] as? String,
//            let lng = object["users.Longitude"] as? Float,
//            let addr = object["users.Addresses"] as? [[String: AnyObject]] else { return }
//        
        
        let abcd = object["users.Latitude"]
        
        print(abcd)
        
//        let swift = "Swift \(version) " + title
//
//        
//        guard lat = object["Latitude"] as? String,
//            let version = object["Longitude"] as? Float,
//            let users = object["users"] as? [[String: AnyObject]] else { return }
//        let swift = "Swift \(version) " + title
//        print(swift)
//        
//        for user in users {
//            guard let name = user["name"] as? String,
//                let age = user["age"] as? Int else { break }
//            switch age {
//            case 22:
//                let one = name + " is \(age) years old."
//                print(one)
//            case 25:
//                let two = name + " is \(age) years old."
//                print(two)
//            case 29:
//                let thre = name + " is \(age) years old."
//                print(thre)
//            default:
//                break
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!

        cell = tableView.dequeueReusableCellWithIdentifier("idCellVideo", forIndexPath: indexPath)
//
//        let AddressTitle = cell.viewWithTag(12) as! UILabel
//       
//        let videoDetails = videosArray[indexPath.row]
//        videoTitle.text = videoDetails["title"] as? String
//        videoThumbnail.image = UIImage(data: NSData(contentsOfURL: NSURL(string: (videoDetails["thumbnail"] as? String)!)!)!)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140.0
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let MapController = self.storyboard?.instantiateViewControllerWithIdentifier("MapControl") as! MapViewController
        MapController.lat = "13.0522327"
        MapController.lng = "80.2736188"
        self.navigationController?.pushViewController(MapController, animated: true)
        
    }

}
