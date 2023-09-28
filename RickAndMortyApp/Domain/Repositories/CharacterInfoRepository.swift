//
//  CharacterInfoRepository.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine


protocol RickAndMortyCharacterInfoRepository{
    func getCharacterInfo(id: Int) -> AnyPublisher<Character, Error>
}
