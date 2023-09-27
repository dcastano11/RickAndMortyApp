//
//  CharaceterListViewModel.swift
//  RickAndMortyApp
//
//  Created by ANRA on 25/09/23.
//

import Foundation
import Combine


class CharacterListViewModel: ObservableObject{
   
    @Published var currentPage = 0
    {
        didSet{
            hasMorePages = currentPage < maxPage
            
        }
    }
    @Published var listData: [Character] = []
    @Published var isLoading = false
    @Published var hasMorePages = true
    var maxPage = 100
    var cancellable: Set<AnyCancellable> = []
    
    func getData(){
        currentPage += 1
        self.isLoading = true
        
        RickAndMortyService().getCharacterPage(page: currentPage).sink { completion in
            
            self.isLoading = false
            switch(completion){
                case .finished:
                    break
                
                case .failure(_):
                    print("failure")
            }
        } receiveValue: { response in
            
            DispatchQueue.main.async {
                self.maxPage = response.info.pages
                self.listData.append(contentsOf: response.results)
            }
        }.store(in: &cancellable)
    }
}
