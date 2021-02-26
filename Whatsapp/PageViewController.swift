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
        self.pageController?.view.backgroundColor = .clear
        /*self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        self.pageController?.didMove(toParent: self)*/

        self.navigationController?.pushViewController(pageController!, animated: true)
        
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return vistas!.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        var index = self.vistas!.firstIndex(of: viewController)!
        currentIndex = self.vistas!.firstIndex(of: viewController)!
        if (index <= 0){
            return self.vistas?.last
        } else {
            index -= 1
        }
        
        return self.vistas![index]
        //return UIViewController()
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = self.vistas!.firstIndex(of: viewController)!
        currentIndex = self.vistas!.firstIndex(of: viewController)!
        if (index >= 2){
            return self.vistas?.first
        } else {
            index += 1
        }
        
        return self.vistas![index]
        //return UIViewController()
    }
    

}


