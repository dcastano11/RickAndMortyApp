//
//  CharaceterInfoView + extension.swift
//  RickAndMortyApp
//
//  Created by ANRA on 27/09/23.
//

import Foundation
import SwiftUI


extension CharacterInfoView{
    
    var episodeView: some View{
        
        ScrollView{
            Text("List of episodes related to the character")
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.pink.opacity(0.9))
                .cornerRadius(8)
                .padding(EdgeInsets(top: 20, leading: 8, bottom: 10, trailing: 8))
                
            VStack (alignment: .leading){
                ForEach(viewModel.theCharacter?.episode ?? [], id: \.self){
                    episode in
                    
                    if let lastComponent = episode.split(separator:"/").last{
                        EpisodeCellView(episode: Int(lastComponent) ?? 0)
                    }
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
        }
        .background(Color("MortyBlue").opacity(1))
    }
    
    var description: some View{
        
        VStack(spacing:4){
            Group {
                CharacterListItemLabelRow(key: "Status:", value: viewModel.theCharacter?.status ?? "Character Status")
                CharacterListItemLabelRow(key: "Species:", value: viewModel.theCharacter?.species ?? "Character Species")
                CharacterListItemLabelRow(key: "Gender:", value: viewModel.theCharacter?.gender ?? "Gender")
                CharacterListItemLabelRow(key: "type:", value: viewModel.theCharacter?.type ?? "Character Type")
                CharacterListItemLabelRow(key: "Origin:", value: viewModel.theCharacter?.origin.name ?? "Origin Name")
                CharacterListItemLabelRow(key: "Location:", value: viewModel.theCharacter?.location.name ?? "Location")
                Spacer().frame(height:10)
                Button {episodesPresented = true}
                label: {
                    Text("Tap to list episodes related to this character")
                        .bold()
                        .foregroundColor(Color("MortyGreen"))
                }
            }
            .foregroundColor(Color.white)
            .padding(.horizontal, 10)
        }
    }
    
    var profileImage: some View{
        
        AsyncImage(url: URL(string: viewModel.theCharacter?.image ?? "")) {
            image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(100)
                .padding(.all, 5)
        } placeholder: {
            ProgressView()
                .frame(width:250, height: 250)
        }.frame(maxWidth:250, maxHeight: 250)
            .background(Color("MortyGreen")
            .opacity(0.8))
            .cornerRadius(100)
    }
}
