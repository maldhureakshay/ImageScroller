//
//  ViewController.swift
//  ImageScroller
//
//  Created by Akshaykumar Maldhure on 8/29/17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageScroller: ImageScroller!
    @IBOutlet weak var pageIndicatorLabel: UILabel!
    @IBOutlet weak var modechangeSwitch: UISwitch!
    
    var sampleImages = ["1.jpg","2.jpg","3.jpg","4.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scroller config
        imageScroller.delegate = self
        imageScroller.isAutoScrollEnabled = true
        imageScroller.scrollTimeInterval = 4.0 //time interval
        imageScroller.scrollView.bounces = false
        imageScroller.setupScrollerWithImages(images: sampleImages)
        self.pageChanged(index: 0)
        
        self.modechangeSwitch.addTarget(self, action: #selector(changeMode), for: UIControlEvents.valueChanged)
    }

    
    func changeMode()  {
        imageScroller.isAutoScrollEnabled = !imageScroller.isAutoScrollEnabled 
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : ImageScrollerDelegate{
    
    func pageChanged(index: Int) {
        self.pageIndicatorLabel.text = String(format: "%d/%d", index+1,self.sampleImages.count)
    }
}
