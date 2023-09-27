//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    
    @ObservedObject var router = Router.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                
                let interactor = CharacterListUseCases()
                let viewModel = CharacterListViewModel(interactor: interactor)
                
                CharacterListView(viewModel: viewModel)
                    .navigationDestination(for: Route.self) {
                    
                    route in
                    
                    switch(route){
                        case .characterInfoView(let id):
                        
                        let interactor = CharacterInfoUseCases()
                        let viewModel = CharacterInfoViewModel(id: id, interactor: interactor)
                        
                        CharacterInfoView(viewModel:viewModel)
                        
                    }
                }
            }
        }
    }
}

enum Route: Hashable{
    case characterInfoView(id:Int)
}

class Router:ObservableObject {
    
    @Published var path = NavigationPath()
    static let shared = Router()
    
    private init(){}
    
    func goToRoute(route: Route){
        
        path.append(route)
        
    }
}
