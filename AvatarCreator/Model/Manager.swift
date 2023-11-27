//
//  Manager.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 26.11.23.
//

import Foundation

final class Manager {
    static let shared = Manager()
    
    
    var gender = Gender().gender
    var name = Name().name
    var height = Height().height
    var weight = Weight().weight
    var age = Age().age
    var photo = Photo().photo
    var colorOfHair = ColorOfHair().colorOfHair
    var colorOfEyes = ColorOfEyes().colorOfEyes
    var character = Character().character
    
}
