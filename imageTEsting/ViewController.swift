//
//  ViewController.swift
//  imageTEsting
//
//  Created by Anil on 12/02/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: "1.jpg")
        if let checkedUrl = NSURL(string: "http://staging.api.cheapeat.com.au/restaurants/1/photo") {
            downloadImage(checkedUrl)
        }
    }
    func downloadImage(url:NSURL){
        
        getDataFromUrl(url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    
    func getDataFromUrl(urL:NSURL, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(urL) { (data, response, error) in
            completion(data: NSData(data: data))
            }.resume()
    }
}

