//
//  FactoryMethod.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation

enum CharactersFactoryRequestType {
    case coreData
    case api
}

protocol CharactersFactory {
  
    func getCharacter(characterType: CharacterType, requestType: CharactersFactoryRequestType, completion: @escaping([CartoonCharacter]) -> Void)
}

class CharacterCreator: CharactersFactory {
    
    func getCharacter(characterType: CharacterType, requestType: CharactersFactoryRequestType, completion: @escaping([CartoonCharacter]) -> Void) {
        
        switch characterType {
        case .rickAndMorty:
            return RickAndMortyCharacter.get(from: requestType, completion: completion)
        case .simpsons:
            return SimpsonsCharacter.get(from: requestType, completion: completion)
        }
    }
}

