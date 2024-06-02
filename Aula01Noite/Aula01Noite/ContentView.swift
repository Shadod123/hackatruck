//
//  ContentView.swift
//  Aula01Noite
//
//  Created by Student04 on 05/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("foto-caminhao-hackatruck")
                .resizable()
                .scaledToFit()
            Text("HackaTruck")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.top)
            
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
