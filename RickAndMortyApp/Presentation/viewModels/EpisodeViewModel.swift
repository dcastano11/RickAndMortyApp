//
//  EpisodeViewModel.swift
//  RickAndMortyApp
//
//  Created by ANRA on 27/09/23.
//

import Foundation
import Combine

protocol EpisodeViewModelProtocol: ObservableObject{
    var episode: EpisodeResponse? {get}
    var isLoading: Bool {get set}
}

class EpisodeViewModel:EpisodeViewModelProtocol{
    
    @Published var episode:EpisodeResponse?
    @Published var isLoading = true
    var store: Set<AnyCancellable> = []
    
    func getEpisode(episode: Int){
        
        GetEpisodeUseCases().getEpisodeInfo(episodeNum: episode).sink { 
            completion in
            
            self.isLoading = false
            switch(completion){
                case .finished:
                    
                    break
                case .failure(let error):
                    print(error)
            
            }
        } receiveValue: { response in
            self.episode = response
        }.store(in: &store)
        
    }
    
}
