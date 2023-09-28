//
//  UIComponents.swift
//  RickAndMortyApp
//
//  Created by David Castaño on 26/09/23.
//

import Foundation
import SwiftUI

struct CharacterListItemLabelRow: View{
    var key: String
    var value: String
    var body: some View {
        HStack(alignment: .top) {
            HStack() {
                Text(key)
                    .multilineTextAlignment(.leading)
                    .font(.system(size:18))
                    .foregroundColor(.black).bold()
                Spacer()
            }.frame(width:90)
            HStack {
                Text(value).fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .font(.system(size:18)).bold()
                Spacer()
            }.frame(maxWidth:.infinity)
            
        }.frame(maxWidth:.infinity)
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
                .bold()
                .foregroundColor(.black.opacity(0.8))
        }
    }
}
