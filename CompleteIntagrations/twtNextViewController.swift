//
//  twtNextViewController.swift
//  CompleteIntagrations
//
//  Created by User on 04/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import TwitterKit

class twtNextViewController: UIViewController {

    var myStringValue:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Base this Tweet ID on some data from elsewhere in your app
        TWTRAPIClient().loadTweetWithID("631879971628183552") { (tweet, error) in
            if let unwrappedTweet = tweet {
                let tweetView = TWTRTweetView(tweet: unwrappedTweet)
                tweetView.center = CGPointMake(self.view.center.x, self.topLayoutGuide.length + tweetView.frame.size.height / 2);
                self.view.addSubview(tweetView)
            } else {
                NSLog("Tweet load error: %@", error!.localizedDescription);
            }
        }
        
        let label = UILabel(frame: CGRectMake(0, 0, 600, 21))
        label.center = CGPointMake(160, 284)
        label.textAlignment = NSTextAlignment.Center
        label.text = "Wellcome \(myStringValue)"
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showActionButton(sender: AnyObject) {
           }
   
}
