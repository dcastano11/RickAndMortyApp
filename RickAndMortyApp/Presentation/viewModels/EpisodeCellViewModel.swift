//
//  EpisodeViewModel.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

protocol EpisodeCellViewModelProtocol: ObservableObject{
    var episode: EpisodeResponse? {get}
    var isLoading: Bool {get set}
    var episodeNumber: Int {get set}
    
    
    func getEpisode()
}

class EpisodeCellViewModel:EpisodeCellViewModelProtocol{
    
    var interactor: GetEpisodeUseCasesProtocol
    @Published var episode:EpisodeResponse?
    @Published var isLoading = true
    @Published var episodeNumber: Int
    var store: Set<AnyCancellable> = []
    
    init(episodeNumber: Int, interactor: GetEpisodeUseCasesProtocol) {
        self.episodeNumber = episodeNumber
        self.interactor = interactor
        
    }
       
    func getEpisode(){
        
        interactor.getEpisodeInfo(episodeNum: episodeNumber).sink {
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
