//
//  AnimationDrivenScrollViewViewController.swift
//  Animation-Driven-UIScrollView
//
//  Created by Ryan Ploetz on 3/22/15.
//  Copyright (c) 2015 Zephadias. All rights reserved.
//

import UIKit

enum ScrollDirection {
    case HORIZONTAL
    case VERTICAL
}

class AnimationDrivenScrollViewViewController: UIViewController, UIScrollViewDelegate {

    var scrollDirection: ScrollDirection!
    var contentSize: CGFloat!
    var scrollView: UIScrollView!
    var animationContainer: [UIView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollDirection = ScrollDirection.HORIZONTAL
        contentSize = 2

    }
    
    func setup() {
        scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        
        if scrollDirection == ScrollDirection.HORIZONTAL {
            scrollView.contentSize = CGSizeMake(self.view.frame.width * self.contentSize, self.view.frame.height)
        } else {
            scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height * self.contentSize)
        }
        
        scrollView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let percent = getScrollPercentage(scrollView)
        
        if let container = self.animationContainer {
            for item:UIView in container {
                item.frame.origin = CGPointMake(item.frame.origin.x, (self.view.frame.height - item.frame.height) * percent)
            }
        }
    }
    
    func getScrollPercentage(scrollView: UIScrollView)->CGFloat {
        if self.scrollDirection == ScrollDirection.HORIZONTAL {
            return scrollView.contentOffset.x / self.view.frame.width
        } else {
            return scrollView.contentOffset.y / self.view.frame.height
        }
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
