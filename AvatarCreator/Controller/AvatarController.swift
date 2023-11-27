//
//  AvatarController.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 25.11.23.
//

import UIKit

class AvatarController: UIViewController {
    var myTextView = UITextView()
    var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()

        drawImageView()
        drawMyLabel()
        view.addSubview(myTextView)
        view.addSubview(imageView)
    }

    func drawImageView() {
        imageView.frame = CGRect(x: view.frame.width / 2 - 100, y: 100, width: 200, height: 200)
        imageView.image = Manager.shared.photo
    }

    func drawMyLabel() {
        myTextView.frame = CGRect(x: imageView.frame.minX, y: imageView.frame.maxY, width: 200, height: 300)
        myTextView.text = """
        Gender: \(Manager.shared.gender)
        
        Name: \(Manager.shared.name)
        
        Height: \(Manager.shared.height)
        
        Weight: \(Manager.shared.weight)
        
        Age: \(Manager.shared.age)
        
        ColorOfHair: \(Manager.shared.colorOfHair)
        
        ColorOfEyes: \(Manager.shared.colorOfEyes)
        
        Character: \(Manager.shared.character)
        """
    }
}
