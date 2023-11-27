//
//  NameController.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 25.11.23.
//

import UIKit

class NameController: UIViewController {
    var myButton = UIButton()
    var myTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        drawTextField()
        drawButton()
        view.addSubview(myButton)
        view.addSubview(myTextField)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myTextField.becomeFirstResponder()
    }

    func drawButton() {
        myButton.frame = CGRect(x: view.frame.width / 2 - 20, y: view.frame.height - 150, width: 40, height: 40)
        myButton.layer.cornerRadius = 7
        myButton.backgroundColor = .red
        myButton.setTitle(">", for: .normal)
        myButton.addTarget(self, action: #selector(addAvatar), for: .touchUpInside)
    }

    func drawTextField() {
        myTextField.frame = CGRect(x: 100, y: 200, width: view.frame.width - 200, height: 40)
        myTextField.layer.borderColor = UIColor.black.cgColor
        myTextField.layer.borderWidth = 1
        myTextField.layer.cornerRadius = 10
        myTextField.keyboardType = .default
    }

    @objc func addAvatar() {
        Manager.shared.name = myTextField.text ?? "Unknown"
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "HeightController") as? HeightController else { return }
        vc.title = "Height"
        navigationController?.pushViewController(vc, animated: true)
    }
}
