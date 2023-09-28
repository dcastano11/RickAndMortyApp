//
//  CharacterInfoRepositoryImpl.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

class RickAndMortyGetCharacterService: Repository, RickAndMortyCharacterInfoRepository {
    
    var url: String
    
    required init(url: String) {
        self.url = url
    }
    
    func getCharacterInfo(id: Int) -> AnyPublisher<Character, Error>{
        guard let url = URL(string: url + "/\(id)") else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return request(url: url)
    }
    
    func getCharacterImage(id: String){}
}
