//
//  EpisodeRepository.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

protocol EpisodeRepository{
    func getEpisodeInfo(episode: Int) -> AnyPublisher<EpisodeResponse, Error>
}
