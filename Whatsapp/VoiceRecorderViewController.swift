//
//  ViewController.swift
//  Whatsapp
//
//  Created by alumnos on 11/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit
import SwiftUI
import AVKit


class VoiceRecorderViewController: UIViewController {
    
    var longgesture : UILongPressGestureRecognizer?
    var url: URL?
    var grabador: AVAudioRecorder?
    var reproductor: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        micButton.setImage(UIImage(named: "Mic Off"), for: .normal)
        
        micButton.addTarget(self, action: #selector(VoiceRecorderViewController.touchDownEvent), for: .touchDown)
        micButton.addTarget(self, action: #selector(VoiceRecorderViewController.touchUpEvent), for: [.touchUpInside, .touchUpOutside])

        let fichero = "grabacion.wav"

        let directorio = FileManager.default.urls(for:
        .documentDirectory, in: .userDomainMask)
        url = directorio.first?.appendingPathComponent(fichero)
        
        let sesion = AVAudioSession.sharedInstance()
        try! sesion.setCategory(AVAudioSession.Category.playAndRecord)
        
    }

    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var textField: UITextView!
    
    @IBAction func resetButton(_ sender: Any) {
    }
    
    @objc func touchDownEvent(_ sender: AnyObject) {
        micButton.setImage(UIImage(named: "Mic"), for: .normal)
        
        //TODO start recording

        grabador = try! AVAudioRecorder(url: url!, settings: [:])
        grabador!.prepareToRecord()
        grabador!.record()
        
    }

    @objc func touchUpEvent(_ sender: AnyObject) {
        micButton.setImage(UIImage(named: "Mic Off"), for: .normal)
        
        //TODO stop recording
        grabador!.stop()
        let audioPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory
        , .userDomainMask, true)[0] as
        NSString).appendingPathComponent("grabacion.wav")
        textField.text = audioPath
        
        var url = URL(string: audioPath)
        do{
            reproductor = try AVAudioPlayer(contentsOf: url!)

            reproductor!.prepareToPlay() // Precarga de canción
            reproductor!.play()
        }catch{}
        
        
    }



    
}


struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

