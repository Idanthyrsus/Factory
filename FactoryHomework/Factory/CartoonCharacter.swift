//
//  Character.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation
import UIKit

protocol CartoonCharacter {
    var name: String? { get set }
    func apply(array: [CartoonCharacter], to anotherArray: inout [CartoonCharacter])
   // func extractCharacters(from array: [CartoonCharacter], applyTo label: UILabel)
   
}

