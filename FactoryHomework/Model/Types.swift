//
//  Types.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation

typealias RickAndMortyCharacters = [RickAndMortyCharacter]
typealias SimpsonsCharacters = [SimpsonsCharacter]

typealias RickAndMortyCharactersNetworkResult = Result<Array<RickAndMortyCharacter>, NetworkError>

typealias RickAndMortyCharactersCallback = (RickAndMortyCharactersNetworkResult) -> ()

typealias SimpsonsCharactersNetworkResult = Result<Array<SimpsonsCharacter>, NetworkError>

typealias SimpsonsCharactersCallback = (SimpsonsCharactersNetworkResult) -> ()
