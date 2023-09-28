//
//  CharacterListuseCases.swift
//  RickAndMortyApp
//
//  Created by ANRA on 26/09/23.
//

import Foundation
import Combine

protocol CharacterListUseCasesProtocol {
    func getCharactersPage(pageNum: Int) -> AnyPublisher<RickAndMortyResponse, Error>
}
class CharacterListUseCases: CharacterListUseCasesProtocol {
    
    let repo: RickAndMortyCharacterListRepository = RickAndMortyListCharacterService(url: baseUrl + getAllCharactersEndpoint)
    
    func getCharactersPage(pageNum: Int) -> AnyPublisher<RickAndMortyResponse, Error>{
        return repo.getCharactersPage(page: pageNum)
    }
    
}
