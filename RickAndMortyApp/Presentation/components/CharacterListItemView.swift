//
//  CharacterListItemView.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import SwiftUI
import NukeUI

struct CharacterListItemView: View, Hashable {
  
    var name:String?
    var status:String?
    var species:String?
    var gender:String?
    var picture:String?
    
    var body: some View {
        Group {
            VStack(spacing:0){
                StrokeText(text: (name ?? "Character Name"), width: 1.5, color: MortyColors.shared.MortyGreen)
                    .font(.title3).bold().padding(EdgeInsets(top: 10, leading: 5, bottom: 4, trailing: 5))
                HStack {
                    profileImage
                        .frame(width:100, height:100)
                        .cornerRadius(5)
                        .padding(.all, 5)
                        .background(Color.pink)
                        .cornerRadius(5)
                        .padding(.all, 8)
                    
                    VStack(alignment:.leading) {
                        Spacer().frame(height:4)
                        CharacterListItemLabelRow(key: "Status: ", value: "\(status ?? "Character Status")")
                        Spacer().frame(height:4)
                        CharacterListItemLabelRow(key: "Species: ", value: "\(species ?? "Character Species")")
                    }
                    .frame(maxWidth:.infinity)
                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                }.padding(EdgeInsets(top: 2, leading: 5, bottom: 8, trailing: 0))
            }
            .frame(width:350)
            .background(MortyColors.shared.MortyBlue.opacity(0.8))
            .cornerRadius(10)
        }
    }
}

extension CharacterListItemView{
    
    var profileImage: some View{
        LazyImage(source:(picture ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKqyMW2p8nWx7NaQliCO6rRTWX3xyMyCulKMPRTQMc&s")){
            state in
            if let image = state.image {
                image.scaledToFit()
            } else if state.error != nil {
                Color.red.scaledToFit() // Indicates an error.
            } else {
                ProgressView(label:{
                    Text("Loading")
                }).scaledToFit()// Acts as a placeholder.
            }
        }
    }
}

struct CharacterListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListItemView()
    }
}
