//
//  FactoryMethod.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation

protocol CharactersFactory {
    func getCharacters(characterType: CharacterType) -> CartoonCharacter
}

class CharacterCreator: CharactersFactory {
    func getCharacters(characterType: CharacterType) -> CartoonCharacter {
        
        switch characterType {
        case .rickAndMorty:
            return RickAndMortyCharacter()
            
        case .simpsons:
            return SimpsonsCharacter()
        }
       
    }
    
    
}

