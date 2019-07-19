//
//  ViewController.swift
//  PhotoApp
//
//  Created by Girls Who Code on 7/12/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePickController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func TakePhoto(_ sender: Any) {
        imagePickController = UIImagePickerController()
        imagePickController.delegate = self
        imagePickController.sourceType = .camera
        present(imagePickController, animated: true, completion: nil)
    }
    
    @IBAction func SavePhoto(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    func saveImage (imageName: String){
        let fileManager = FileManager.default
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        let image = myImageView.image!
        
        let imageData = image.pngData()
        
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
        
    }
    
    
    //this function is used when the user takes picture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
        info: [UIImagePickerController.InfoKey:Any]) {
        
        imagePickController.dismiss(animated: true, completion: nil)
        
    myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
    }

}

