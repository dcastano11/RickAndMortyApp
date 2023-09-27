//
//  CharacterListItemView.swift
//  RickAndMortyApp
//
//  Created by ANRA on 25/09/23.
//

import SwiftUI

struct CharacterListItemView: View {
    
    
    var name:String?
    var status:String?
    var species:String?
    var gender:String?
    var picture:String?
    
    var body: some View {
        Group {
            VStack {
                Text((name ?? "Character Name")).font(.title3).bold().padding(EdgeInsets(top: 10, leading: 5, bottom: 4, trailing: 5))
                HStack {
                    AsyncImage(url: URL(string:
                                            picture ??
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKqyMW2p8nWx7NaQliCO6rRTWX3xyMyCulKMPRTQMc&s")!) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            
                    } placeholder: {
                        ProgressView(label: {
                            Text("Loading Image")
                        })
                        .scaledToFill()
                          
                    }
                    .frame(maxWidth:120)
                    .padding(.all, 8)
                    .background(Color.black.opacity(0.5))
                    .padding(.all, 8)
                    VStack(alignment:.leading) {
                        //CharacterListItemLabelRow(key: "Name: ", value: "\(name ?? "Character Name")")
                        Spacer().frame(height:4)
                        CharacterListItemLabelRow(key: "Status: ", value: "\(status ?? "Character Status")")
                        Spacer().frame(height:4)
                        CharacterListItemLabelRow(key: "Species: ", value: "\(species ?? "Character Species")")
                        Spacer().frame(height:4)
                        CharacterListItemLabelRow(key: "Gender: ", value: "\(gender ?? "Character Gender")")
                        
                    }
                    .frame(maxWidth:.infinity)
                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                    
                    
                }
            }.frame(width:350)
                .background(Color.green.opacity(0.7))
            .cornerRadius(10)
            
            

            
        }
    }
}

struct CharacterListItemLabelRow: View{
    var key: String
    var value: String
    
    var body: some View {
        HStack(alignment: .top) {
            
            HStack() {
                
                Text(key).multilineTextAlignment(.leading).font(.system(size:18))
                Spacer()
            }.frame(width:90)
            HStack {
                Text(value).fixedSize(horizontal: false, vertical: true) .multilineTextAlignment(.leading).font(.system(size:18)).bold()
                Spacer()
            }.frame(maxWidth:.infinity)
            
        }.frame(maxWidth:.infinity)
            
    }
    
    
}

struct CharacterListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListItemView()
    }
}
