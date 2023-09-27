//
//  CharacterListRepository.swift
//  RickAndMortyApp
//
//  Created by ANRA on 26/09/23.
//

import Foundation
import Combine

protocol RickAndMortyCharacterListRepository{
    func getCharactersPage(page: Int) -> AnyPublisher<RickAndMortyResponse, Error>
}
