//
//  EpisodeInfoView.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import SwiftUI

struct EpisodeCellView<VM>: View where VM:EpisodeCellViewModelProtocol {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        
        VStack(alignment: .leading){
            if(viewModel.isLoading){ProgressView()}
            else{
                HStack {
                    VStack(alignment:.leading){
                        Text("Episode No.: \(viewModel.episodeNumber)")
                        Text("Episode Name: \(viewModel.episode?.name ?? "Episode with no name")")
                        Text("Launching date: \(viewModel.episode?.air_date ?? "Episode with no date")")
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 5)
        .padding(.horizontal, 8)
        .onAppear{viewModel.getEpisode()}
        .background(MortyColors.shared.MortyGreen.opacity(0.8))
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 2))
    }
}

struct EpisodeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCellView(viewModel: EpisodeCellViewModel(episodeNumber: 1, interactor: GetEpisodeUseCases()))
    }
}
