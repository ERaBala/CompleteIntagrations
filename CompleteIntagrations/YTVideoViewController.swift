//
//  YTVideoViewController.swift
//  CompleteIntagrations
//
//  Created by User on 04/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class YTVideoViewController: UIViewController {

    @IBOutlet weak var VideoPlay: YTPlayerView!
    @IBOutlet weak var Lable: UILabel!
    
    
    var videoID: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VideoPlay.loadWithVideoId(videoID)

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
