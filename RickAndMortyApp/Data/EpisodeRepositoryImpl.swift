//
//  EpisodeRepositoryImpl.swift
//  RickAndMortyApp
//
//  Created by ANRA on 27/09/23.
//

import Foundation
import Combine

class EpisodeService: Repository, EpisodeRepository {
    
    var url: String
    
    required init(url: String) {
        self.url = url
    }
    
    func getEpisodeInfo(episode: Int) -> AnyPublisher<EpisodeResponse, Error>{
        guard let url = URL(string: url + "/\(episode)") else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return request(url: url)
    }
}
