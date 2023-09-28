//
//  CharacterInfoView.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import SwiftUI

struct CharacterInfoView<VM>: View where VM: CharacterInfoViewModelProtocol{
    
    @ObservedObject var viewModel: VM
    @State var episodesPresented = false
    
    var body: some View {
        ZStack{
            Image("Back2").resizable().ignoresSafeArea()
            VStack(spacing:0){
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                ScrollView{
                        VStack {
                            Text(viewModel.theCharacter?.name ?? "Character Name").font(.title).foregroundColor(Color.pink).bold()
                            
                            profileImage
                            Spacer().frame(height:30)
                            description
                                .padding()
                                .background(MortyColors.shared.MortyBlue.opacity(0.7))
                                .cornerRadius(10)
                        }
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .onAppear{
                            viewModel.getCharacterInfo()
                        }
                }.padding(.top, 20)
            }
            .sheet(isPresented: $episodesPresented, content: {episodeView})
        }
    }
}

struct CharacterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoView(viewModel: CharacterInfoViewModel(id: 3, interactor: CharacterInfoUseCases()))
    }
}
