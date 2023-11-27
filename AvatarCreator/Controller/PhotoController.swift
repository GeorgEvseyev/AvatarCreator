//
//  PhotoController.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 25.11.23.
//

import UIKit

class PhotoController: UIViewController {
    
    
    var imageView = UIImageView()
    var myPhotoButton = UIButton()
    var myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawPhotoButton()
        drawButton()
        
        
        view.addSubview(myButton)
        view.addSubview(myPhotoButton)
    }

    func drawPhotoButton() {
        myPhotoButton.frame = CGRect(x: view.frame.width / 2 - 100, y: 100, width: 200, height: 200)
        myPhotoButton.backgroundColor = .black
        myPhotoButton.setTitle("Photo", for: .normal)
        myPhotoButton.addTarget(self, action: #selector(drawImagePicker), for: .touchUpInside)
    }

    func drawButton() {
        myButton.frame = CGRect(x: view.frame.width / 2 - 20, y: view.frame.height - 150, width: 40, height: 40)
        myButton.layer.cornerRadius = 7
        myButton.backgroundColor = .red
        myButton.setTitle(">", for: .normal)
        myButton.addTarget(self, action: #selector(addAvatar), for: .touchUpInside)
    }
    
    func drawImageView() {
        imageView.frame = CGRect(x: view.frame.width / 2 - 100, y: 100, width: 200, height: 200)
    }

    @objc func addAvatar() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ColorOfHairController") as? ColorOfHairController else { return }
        vc.title = "Color of Hair"
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func drawImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
}

extension PhotoController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            drawImageView()
            imageView.image = image
            Manager.shared.photo = image
            view.addSubview(imageView)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
