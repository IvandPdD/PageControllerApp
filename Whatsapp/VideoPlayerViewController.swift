//
//  VideoPlayerViewController.swift
//  Whatsapp
//
//  Created by Apps2t on 15/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class VideoPlayerViewController: UIViewController{
    
    var reproductor: AVPlayer!
    var reproductorViewController: AVPlayerViewController!
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
     
        let videoPath = Bundle.main.path(forResource: "videoplayback", ofType: "mp4")!
        
        //let url = URL(string: videoPath)
        let url = NSURL(fileURLWithPath: videoPath)
        reproductor = AVPlayer(url: url as URL)
        reproductorViewController = AVPlayerViewController()
        reproductorViewController.player = reproductor
        reproductorViewController.view.frame = CGRect(x: 0,y: 0,width: videoView.frame.width, height: videoView.frame.height)
        reproductorViewController.modalPresentationStyle = .none
        self.videoView.addSubview(reproductorViewController.view)
    }
}
