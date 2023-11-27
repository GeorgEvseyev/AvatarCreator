//
//  ViewController.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 25.11.23.
//

import UIKit

class ViewController: UIViewController {

    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawButton()
        view.addSubview(myButton)
    }
    
    func drawButton() {
        myButton.frame = CGRect(x: view.frame.width / 2 - 20, y: view.frame.height - 150, width: 40, height: 40)
        myButton.layer.cornerRadius = 7
        myButton.backgroundColor = .red
        myButton.setTitle(">", for: .normal)
        myButton.addTarget(self, action: #selector(addAvatar), for: .touchUpInside)
    }
    
    @objc func addAvatar() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "GenderController") as? GenderController else { return }
        vc.title = "Gender"
        navigationController?.pushViewController(vc, animated: true)
    }


}

