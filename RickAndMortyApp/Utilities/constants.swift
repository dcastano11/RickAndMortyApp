//
//  constants.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//
import SwiftUI
import Foundation

let baseUrl = "https://rickandmortyapi.com/api"
let getAllCharactersEndpoint = "/character"
let getOneCharacterEndpoint = "/character"
let getEpisodeEndpoint = "/episode"


class MortyColors{
    
    private init(){}
    
    static let shared = MortyColors()
    
    let MortyGreen = Color("MortyGreen")
    let MortyBlue = Color("MortyBlue")
    let MortyPink = Color("MortyPink")
    
}
