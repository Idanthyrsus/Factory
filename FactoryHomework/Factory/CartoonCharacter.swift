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
    static func get(from requestType: CharactersFactoryRequestType, completion: @escaping([CartoonCharacter]) -> Void)
}

