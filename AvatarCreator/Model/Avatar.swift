//
//  Avatar.swift
//  AvatarCreator
//
//  Created by Георгий Евсеев on 25.11.23.
//

import Foundation

final class Avatar {
    var gender: Gender
    var name: Name
    var height: Height
    var age: Age
    var photo: Photo
    var colorOfHair: ColorOfHair
    var colorOfEyes: ColorOfEyes
    var character: Character
    init(gender: Gender, name: Name, height: Height, age: Age, photo: Photo, colorOfHair: ColorOfHair, colorOfEyes: ColorOfEyes, character: Character) {
        self.gender = gender
        self.name = name
        self.height = height
        self.age = age
        self.photo = photo
        self.colorOfHair = colorOfHair
        self.colorOfEyes = colorOfEyes
        self.character = character
    }
}
