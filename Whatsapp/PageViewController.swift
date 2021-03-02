//
//  PageViewController.swift
//  Whatsapp
//
//  Created by Apps2t on 15/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class PageViewController: UIViewController{
    
    private var pageController: UIPageViewController?
    var currentIndex: Int = 0
    
    var vistas: [UIViewController]?

    @IBOutlet weak var pageDots: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vistas = [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageVC"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoPlayerVC"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VoiceRecorderVC")]
        
        setupPageController()
    }
    
    func setupPageController() {
        
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
          
        let initialVC = vistas![0]
        
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)

        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.view.addSubview(self.pageController!.view)
        
        self.view.bringSubviewToFront(pageDots)
        self.pageDots.numberOfPages = vistas!.count
        self.pageDots.currentPage = 0

    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.vistas!.firstIndex(of: viewController)!
        
        if (index <= 0){
            return self.vistas?.last
        } else {
            index -= 1
        }
        
        return self.vistas![index]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = self.vistas!.firstIndex(of: viewController)!
        
        if (index >= 2){
            return self.vistas?.first
        } else {
            index += 1
        }
        
        return self.vistas![index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        self.currentIndex = self.vistas!.firstIndex(of: pendingViewControllers.first!)!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        self.pageDots.currentPage = self.currentIndex
    }

}


