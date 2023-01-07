//
//  Characters.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation
import UIKit


struct RickAndMortyCharacter: Codable, CartoonCharacter {
    func apply(array: [CartoonCharacter], to anotherArray: inout [CartoonCharacter]) {
        anotherArray = array
    }
    
//
//    func extractCharacters(from array: [CartoonCharacter], applyTo label: UILabel) {
//        label.text = array[0].self.name
//    }
    
    var id: Int?
    var name: String?
    var status: Status?
    var species: Species?
    var type: String?
    var gender: Gender?
    var origin: Origin?
    var image: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Origin: String, Codable {
    case abadango = "Abadango"
    case earthC137 = "Earth (C-137)"
    case earthReplacementDimension = "Earth (Replacement Dimension)"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}



struct SimpsonsCharacter: Codable, CartoonCharacter {
    func apply(array: [CartoonCharacter], to anotherArray: inout [CartoonCharacter]) {
        anotherArray = array
    }
    
   
  
//    func extractCharacters(from array: [CartoonCharacter], applyTo label: UILabel) {
//        label.text = array[0].self.name
//    }
 
   

    var id: Int?
    var name, normalizedName: String?
    var gender: SimpsonGender?

    enum CodingKeys: String, CodingKey {
        case id, name
        case normalizedName = "normalized_name"
        case gender
    }
}

enum SimpsonGender: String, Codable {
    case edBegleyJr = "ed begley jr"
    case empty = ""
    case f = "f"
    case homerMargeAndBart = "homer marge and bart"
    case hulkingShamblingFigure = "hulking shambling figure"
    case kearneyJr = "kearney jr"
    case m = "m"
    case martinPrinceSr = "martin prince sr"
    case nedwardFlandersSr = "nedward flanders sr"
    case rayJayJohnsonJr = "ray jay johnson jr"
    case rogerMeyersJr = "roger meyers jr"
    case the5 = "& #5'"
    case waylonSmithersSr = "waylon smithers sr"
}


