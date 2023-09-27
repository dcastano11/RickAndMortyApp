//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by ANRA on 25/09/23.
//

import SwiftUI



struct CharacterListView: View {
    
    @ObservedObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "Back")!)
                .resizable().ignoresSafeArea()
       
                List{
                    ForEach(Array(viewModel.listData.enumerated()), id: \.element){
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
                                print("Tapped")
                                Router.shared.goToRoute(route: .characterInfoView(id: 1))
                            }
                    )

                    }.listRowBackground(Color.clear)
                              
                    
                    if(viewModel.hasMorePages){
                        ProgressView {
                            Text("Loading more characters ...")
                        }
                        .listRowBackground(Color.clear)
                        .onAppear{
                            viewModel.getData()
                        }
                    }else{
                        Text("No more results to load")
                            .listRowBackground(Color.clear)
                        
                    }
                    
                }.scrollContentBackground(.hidden)
                
                
                
                
            
                    
            
        }//.onAppear{viewModel.getData()}
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
