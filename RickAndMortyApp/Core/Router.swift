//
//  Router.swift
//  RickAndMortyApp
//
//  Created by ANRA on 27/09/23.
//

import Foundation
import SwiftUI

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
