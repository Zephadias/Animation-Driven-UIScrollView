//
//  ViewController.swift
//  Animation-Driven-UIScrollView
//
//  Created by Ryan Ploetz on 3/22/15.
//  Copyright (c) 2015 Zephadias. All rights reserved.
//

import UIKit

class ViewController: AnimationDrivenScrollViewViewController {

    var box:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setup your objects you want to animate
        box = UIView(frame: CGRectMake(self.view.frame.width/2, 0, 50, 50))
        box.backgroundColor = UIColor.redColor()
        self.view.addSubview(box)
        
        // Add the animations to the container for animations
        self.animationContainer = [box]
        
        // setup the properties of your scrolling
        self.contentSize = 2
        self.scrollDirection = ScrollDirection.HORIZONTAL
        
        // call setup to complete the initialization
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

