//
//  CharacterInfoUseCases.swift
//  RickAndMortyApp
//
//  Created by ANRA on 26/09/23.
//

import Foundation
import Combine

protocol CharacterUseCasesProtocol{
    func getCharacterInfo(characterId: Int) -> AnyPublisher<Character, Error>
}

class CharacterInfoUseCases: CharacterUseCasesProtocol{
    
    let repo: RickAndMortyCharacterInfoRepository = RickAndMortyGetCharacterService(url: baseUrl + getOneCharacterEndpoint)
    
    func getCharacterInfo(characterId: Int) -> AnyPublisher<Character, Error>{
        return repo.getCharacterInfo(id: characterId)
    }
    
}
