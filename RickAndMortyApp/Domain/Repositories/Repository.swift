//
//  Repository.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import Combine

protocol Repository{
    var url:String {get set}
    init(url:String)
}

extension Repository{
    
    func request<responseModel: Decodable>(url: URL) -> AnyPublisher<responseModel, Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: responseModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
