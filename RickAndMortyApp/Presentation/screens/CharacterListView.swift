//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import SwiftUI
import NukeUI

struct CharacterListView<VM>: View where VM: CharacterListViewModelProtocol {
    
    @ObservedObject var viewModel: VM
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "Back")!)
                .resizable().ignoresSafeArea()
            
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                searchField
                ScrollView{
                    LazyVStack {
                        
                        Group{
                            ForEach(Array(viewModel.filteredListData.enumerated()), id: \.element){
                                index, element in
                
                            CharacterListItemView(
                                    name: element.name,
                                    status: element.status,
                                    species: element.species,
                                    gender: element.gender,
                                    picture: element.image
                            )
                            .id(index)
                                .gesture(
                                    TapGesture()
                                        .onEnded { _ in
                                            Router.shared.goToRoute(route: .characterInfoView(id: element.id))
                                        }
                                )

                            }//.listRowBackground(Color.clear)
                            
                            if(viewModel.hasMorePages){
                                ProgressView {
                                    Text("Loading more characters ...")
                                }
                                
                                .onAppear{
                                    viewModel.getMoreData()
                                }
                            }
                            else{
                                Text("No more results to load")
                                    //.listRowBackground(Color.clear)
                            }
                        }.listRowBackground(Color.clear)
                        
                    }
                }
            }
       }
    }
    
    var searchField: some View{
        TextField(text: $viewModel.textFieldBuffer) {
            Text("Filter characters by typing")
        }
        .frame(height: 40)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(MortyColors.shared.MortyGreen)
        .background(in: RoundedRectangle(cornerRadius: 10.0))
        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
        
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: CharacterListViewModel(interactor: CharacterListUseCases()))
    }
}
