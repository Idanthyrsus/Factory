//
//  Characters.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation
import UIKit


struct RickAndMortyCharacter: Codable, CartoonCharacter {
    
    var id: Int?
    var name: String?
    var status: Status?
    var species: Species?
    var type: String?
    var gender: Gender?
    var origin: Origin?
    var image: String?

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

private static func getFromCoreData() -> [CartoonCharacter] {
    return []
}

static func get(from requestType: CharactersFactoryRequestType, completion: @escaping([CartoonCharacter]) -> Void) {
    switch requestType {
    case .api:
        getFromApi(completion: completion)
    case .coreData:
        completion(getFromCoreData())
    }
}

private static func getFromApi(completion: @escaping ([CartoonCharacter]) -> Void) {
    let urlSession: NetworkLayer = UrlSessionLayer()
    urlSession.getAllSimpsonsCharacters { result in
        DispatchQueue.main.async {
            do {
                let array = try result.get()
                completion(array)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        }
    }
}

}

struct SimpsonsCharacter: Codable, CartoonCharacter {
    
    var id: Int?
    var name, normalizedName: String?
    var gender: SimpsonGender?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case normalizedName = "normalized_name"
        case gender
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
    
    static func getFromCoreData() -> [CartoonCharacter] {
        return []
    }
    
    static func get(from requestType: CharactersFactoryRequestType, completion: @escaping([CartoonCharacter]) -> Void) {
        switch requestType {
        case .api:
            getFromApi(completion: completion)
        case .coreData:
            completion(getFromCoreData())
        }
    }
    
    static func getFromApi(completion: @escaping ([CartoonCharacter]) -> Void) {
        let urlSession: NetworkLayer = UrlSessionLayer()
        urlSession.getAllRickAndMortyCharacters { result in
            DispatchQueue.main.async {
                do {
                    let array = try result.get()
                    completion(array)
                } catch {
                    print(error.localizedDescription)
                    completion([])
                }
            }
        }
    }
    
}


