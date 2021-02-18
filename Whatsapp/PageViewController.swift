//
//  PageViewController.swift
//  Whatsapp
//
//  Created by Apps2t on 15/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController{
    
    private var pageController: UIPageViewController?
    
    var vistas: [UIViewController]?
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vistas = [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageVC"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoPlayerVC"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VoiceRecorderVC")]
        setupPageController()
    }
    func setupPageController() {
       self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.pageController?.view.backgroundColor = .clear
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        self.pageController?.didMove(toParent: self)
       
       let initialVC = viewControllers![0]
       
       self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
       
       self.pageController?.didMove(toParent: self)
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        var index = vistas!.firstIndex(of: pageViewController.presentedViewController!)!
        
        if (index < 0){
            return vistas![2]
        } else {
            index -= 1
        }
        
        return vistas![index]
        //return UIViewController()
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if (currentIndex > 2){
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        
        return vistas![currentIndex]
        //return UIViewController()
    }

}

