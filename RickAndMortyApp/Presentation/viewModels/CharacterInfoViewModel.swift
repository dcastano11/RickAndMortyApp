//
//  CharacterInfoViewModel.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

protocol CharacterInfoViewModelProtocol: ObservableObject {
    
    var theCharacter: Character? {get}
    
    func getCharacterInfo()
}

class CharacterInfoViewModel: CharacterInfoViewModelProtocol{
    
    var interactor: CharacterUseCasesProtocol //= CharacterInfoUseCases()
    @Published var theCharacter: Character?
    var store: Set<AnyCancellable> = []
    var id:Int = 0
    
    init(theCharacter: Character? = nil, id: Int, interactor: CharacterUseCasesProtocol) {
        self.interactor = interactor
        self.theCharacter = theCharacter
        self.id = id
    }
    
    func getCharacterInfo(){
        interactor
            .getCharacterInfo(characterId: self.id)
            .sink { completion in
                switch (completion){
                case .finished:
                    break
                    
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { char in
                
                self.theCharacter = char
                
            }.store(in: &store)
    }
}
