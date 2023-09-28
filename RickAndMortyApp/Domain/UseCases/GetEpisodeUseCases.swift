//
//  CharacterListuseCases.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

protocol GetEpisodeUseCasesProtocol{
    func getEpisodeInfo(episodeNum: Int) -> AnyPublisher<EpisodeResponse, Error>
}

class GetEpisodeUseCases: GetEpisodeUseCasesProtocol {
    
    let repo: EpisodeRepository = EpisodeService(url: baseUrl + getEpisodeEndpoint)
    
    func getEpisodeInfo(episodeNum: Int) -> AnyPublisher<EpisodeResponse, Error>{
        return repo.getEpisodeInfo(episode: episodeNum)
    }
    
}
