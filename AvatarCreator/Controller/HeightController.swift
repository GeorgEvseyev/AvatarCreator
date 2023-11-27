//
//  FileController.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 25.11.23.
//

import UIKit

class HeightController: UIViewController {
    
    var height = Height()
    
    var myPicker = UIPickerView()
    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawPicker()
        drawButton()
        view.addSubview(myPicker)
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
        myPicker.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 200)
        myPicker.dataSource = self
        myPicker.delegate = self
    }
    
    @objc func addAvatar() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "WeightController") as? WeightController else { return }
        vc.title = "Weight"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HeightController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        height.heights.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(height.heights[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Manager.shared.height = height.heights[row]
    }
    
    
}
