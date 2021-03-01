//
//  ImageViewController.swift
//  Whatsapp
//
//  Created by Apps2t on 15/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
        }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
            present(imagePicker, animated: true, completion: nil)
            
        }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.image.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func next(_ sender: Any) {
        
    }
}
