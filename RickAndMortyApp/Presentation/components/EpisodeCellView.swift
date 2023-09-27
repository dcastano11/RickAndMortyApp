//
//  EpisodeInfoView.swift
//  RickAndMortyApp
//
//  Created by ANRA on 27/09/23.
//

import SwiftUI

struct EpisodeInfoView: View {
    @ObservedObject var viewModel: EpisodeViewModel = EpisodeViewModel()
    var episode: Int
    var body: some View {
        
        VStack(alignment: .leading){
            if(viewModel.isLoading){
                ProgressView()
            }
            else{
                Text("Episode No.: \(episode)")
                Text("Episode Name: \(viewModel.episode?.name ?? "Episode with no name")")
                Text("Launching date: \(viewModel.episode?.air_date ?? "Episode with no date")")
                Divider()
            }
        }
        .padding(.vertical, 2)
        .padding(.horizontal, 8)
        
        
        .onAppear{
            viewModel.getEpisode(episode: self.episode)
            //call the episode repo
        }
        
        .background(Color("MortyGreen").opacity(0.8))
        .cornerRadius(8)
    }
}

struct EpisodeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeInfoView(episode:1)
    }
}
