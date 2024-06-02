//
//  D2.swift
//  Aula01Noite
//
//  Created by Student04 on 05/04/23.
//

import SwiftUI

struct D2View: View {
    var body: some View {
        VStack {
            Image("image001")
                .resizable()
                .scaledToFit()
                
            Spacer()
            
            Image("foto-caminhao-hackatruck")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())

            Spacer()
            
            HStack{
                Text("Maker")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                Text("Space")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            }
            .padding(.top)
            .frame(width: 300.0, height: 200.0)
            .background(.black)
            .border(Color.black)
        }
        .padding()
    }
}

struct D2View_Previews: PreviewProvider {
    static var previews: some View {
        D2View()
    }
}
