//
//  CharaceterListViewModel.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine


protocol CharacterListViewModelProtocol: ObservableObject {
    
    var currentPage: Int {get set}
    var listData: [Character] {get}
    var filteredListData: [Character]{get}
    var isLoading: Bool {get}
    var hasMorePages: Bool {get}
    var textFieldBuffer: String {get set}
    
    func getMoreData()
}

class CharacterListViewModel: CharacterListViewModelProtocol{
    
    @Published var textFieldBuffer: String = ""
    {didSet{filterCharacters(searchWord: textFieldBuffer)}}
    var interactor: CharacterListUseCasesProtocol// = CharacterListUseCases()
    @Published var currentPage = 0
    {didSet{hasMorePages = currentPage < maxPage}}
    @Published var listData: [Character] = []
    {didSet{filterCharacters(searchWord: textFieldBuffer)}}
    @Published var filteredListData: [Character] = []
    @Published var isLoading = false
    @Published var hasMorePages = true
    var maxPage = Int.max
    var cancellable: Set<AnyCancellable> = []
    
    init(interactor: CharacterListUseCasesProtocol) {
        self.interactor = interactor
    }
    
    func filterCharacters(searchWord:String?){
        if let word = searchWord, word != "" {
            filteredListData = []
            filteredListData = listData.filter { character in
                character.name.lowercased().contains(word.lowercased())
            }
            filteredListData.forEach { char in
                print(char)
            }
        }
        else{filteredListData = listData}
    }
    
    func getMoreData(){
        currentPage += 1
        self.isLoading = true
        
        interactor.getCharactersPage(pageNum: currentPage).sink { completion in
            
            self.isLoading = false
            switch(completion){
                case .finished:
                    break
                
                case .failure(_):
                    print("failure")
            }
        } receiveValue: { response in
            self.maxPage = response.info.pages
            self.listData.append(contentsOf: response.results)

        }.store(in: &cancellable)
    }
}
