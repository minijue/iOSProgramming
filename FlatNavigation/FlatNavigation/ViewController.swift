//
//  ViewController.swift
//  FlatNavigation
//
//  Created by 王珏 on 2018/7/12.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    var pageViewController: UIPageViewController!
    var pageImages: NSArray!
    
    func viewController(atIndex index: Int) -> PageContentViewController? {
        if index >= self.pageImages.count {
            return nil
        }
        
        let pageContentViewController: PageContentViewController = self.storyboard!.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController
        pageContentViewController.imagefile = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).pageIndex
        
        if index == 0 {
            return nil
        }
        
        index -= 1
        return self.viewController(atIndex: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).pageIndex
        
        index += 1
        if index >= self.pageImages.count {
            return nil
        }
        
        return self.viewController(atIndex: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageImages = ["Image1" as Any,"Image2" as Any, "Image3" as Any]
        
        self.pageViewController = (self.storyboard?.instantiateViewController(withIdentifier: "PageViewController")) as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startingViewController = self.viewController(atIndex: 0)
        self.pageViewController.setViewControllers([startingViewController!], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

