//
//  NetworkLayer.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation

protocol NetworkLayer {
    func getAllRickAndMortyCharacters(callback: @escaping RickAndMortyCharactersCallback)
    func getAllSimpsonsCharacters(callback: @escaping SimpsonsCharactersCallback)
}
