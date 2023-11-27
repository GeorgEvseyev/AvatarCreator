//
//  WeightController.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 25.11.23.
//

import UIKit

class WeightController: UIViewController {
    
    var weight = Weight()
    var picker = UIPickerView()
    var myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        drawPicker()
        drawButton()
        view.addSubview(picker)
        view.addSubview(myButton)
    }

    func drawButton() {
        myButton.frame = CGRect(x: view.frame.width / 2 - 20, y: view.frame.height - 150, width: 40, height: 40)
        myButton.layer.cornerRadius = 7
        myButton.backgroundColor = .red
        myButton.setTitle(">", for: .normal)
        myButton.addTarget(self, action: #selector(addAvatar), for: .touchUpInside)
    }
    
    func drawPicker() {
        picker.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 200)
        picker.dataSource = self
        picker.delegate = self
    }

    @objc func addAvatar() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AgeController") as? AgeController else { return }
        vc.title = "Age"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WeightController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weight.weights.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(weight.weights[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Manager.shared.weight = weight.weights[row]
    }
}
