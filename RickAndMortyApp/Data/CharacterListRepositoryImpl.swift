//
//  CharacterListRepositoryImpl.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

class RickAndMortyListCharacterService: Repository, RickAndMortyCharacterListRepository {
    
    var url: String
    
    required init(url: String) {
        self.url = url
    }
    
    func getCharactersPage(page: Int) -> AnyPublisher<RickAndMortyResponse, Error>{
        guard let url = URL(string: url + "/?page=\(page)") else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return request(url: url)
    }
}
