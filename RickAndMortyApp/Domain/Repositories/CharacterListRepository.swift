//
//  CharacterListRepository.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

protocol RickAndMortyCharacterListRepository{
    func getCharactersPage(page: Int) -> AnyPublisher<RickAndMortyResponse, Error>
}
