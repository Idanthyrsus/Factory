//
//  UrlSession.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation

class UrlSessionLayer: NetworkLayer {
    
    public init() { }
    
    private let simpsonsUrl = "https://api.sampleapis.com/simpsons/characters"
    private let rickAndMortyUrl = "https://api.sampleapis.com/rickandmorty/characters"
    
    func getAllRickAndMortyCharacters(callback: @escaping RickAndMortyCharactersCallback) {
        guard let url = URL(string: rickAndMortyUrl) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                callback(Result.failure(.custom(error?.localizedDescription ?? "")))
                return
            }
            
            if data == nil {
                callback(Result.failure(.emptyData))
                return
            }
            
            do {
                let futurama = try JSONDecoder().decode(RickAndMortyCharacters.self, from: data!)
                callback(Result.success(futurama))
            } catch {
                callback(Result.failure(.wrongJson("Wrong format")))
            }
        }.resume()
    }
    
    func getAllSimpsonsCharacters(callback: @escaping SimpsonsCharactersCallback) {
        guard let url = URL(string: simpsonsUrl) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                callback(Result.failure(.custom(error?.localizedDescription ?? "")))
            }
            
            if data == nil {
                callback(Result.failure(.emptyData))
            }
            
            do {
                let simpsons = try JSONDecoder().decode(SimpsonsCharacters.self, from: data!)
                callback(Result.success(simpsons))
            } catch {
                callback(Result.failure(.wrongJson("Wrong format")))
            }
        }.resume()
    }
    
    
  
    
    
}
