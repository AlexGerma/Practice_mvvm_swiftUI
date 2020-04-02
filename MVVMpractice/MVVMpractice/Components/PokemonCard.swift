//
//  PokemonCard.swift
//  MVVMpractice
//
//  Created by Alexis German Hurtado on 01/02/20.
//  Copyright © 2020 Alexis German Hurtado. All rights reserved.
//

import SwiftUI

struct PokemonCard: View {
    var id: Int
    var color : Color
    var pokemon_name: String
    var pokemon_key: Int
    var seccion: String
    var pokemon_type: String
    var imgBanner: Image
    var imgType: Image
    var onClick: ((_ value: Int) -> Void)?
    
    var body: some View {
        VStack{
            HStack{
                HStack {
                    Text("")
                     Spacer()
                }.frame(height:200)
            }.background(imgBanner.resizable().fixedSize())
                .cornerRadius(17)
                .padding(.horizontal).padding(.bottom,-30)
                Button(action: {
                    self.onClick!(self.id)
                },label: {
                     VStack{
                         VStack {
                             HStack {
                                 cardTitle(text: self.pokemon_name, sizeFont: 19)
                                 Spacer()
                                 Image(systemName: "greaterthan").resizable().frame(width:10, height: 20)
                                     .font(.system(size: 30 ,weight: .semibold))
                                     .foregroundColor(.white).padding(.top)
                                 
                             }.padding(.horizontal)
                             HStack {
                                 cardSubTitle(text: "\(self.pokemon_key)", sizeFont: 14)
                                 cardSubTitle(text: "-", sizeFont: 14)
                                 cardSubTitle(text: self.seccion, sizeFont: 14)
                                 Spacer()
                             }.padding(.horizontal).padding(.top,-10)
                         }.padding(.top,10).padding(.bottom,-10)
                         
                         VStack {
                             HStack{
                                 Spacer()
                                 VStack(alignment: .trailing) {
                                     cardSubTitle(text: self.pokemon_type,sizeFont: 15)
                                 }
                                 HStack {
                                    cardTypeImg(img: imgType)
                                 }
                             }.padding(.horizontal).padding(.bottom)
                         }
                         
                     }.background(self.color)
                         .cornerRadius(17).padding(.horizontal)
                } ).buttonStyle(PlainButtonStyle())
            }
    }
}

//internal text component use in title course
struct cardTitle: View {
    var text: String
    var sizeFont: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(size: sizeFont))
            .foregroundColor(.white)
            .fontWeight(.semibold)
    }
}

//image the user with circle
struct cardTypeImg: View {
    var img: Image
    var body: some View {
        img.resizable().clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 0))
            .frame(width:60, height: 50)
    }
}

//internal text component use in subtitle course
struct cardSubTitle: View {
    var text: String
    var sizeFont: CGFloat
    var body: some View {
            Text(text)
            .font(.system(size: sizeFont))
            .foregroundColor(.white)
    }
}


struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
       PokemonCard(id: 1,color: Color.blue,pokemon_name:"charizar", pokemon_key: 300,seccion: "Primera generacion",pokemon_type: " Chazarizar",imgBanner: Image("launch"),imgType: Image("launch"),onClick:{value in
        print(value)} )
    }
}
