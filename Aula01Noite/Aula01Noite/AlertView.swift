//
//  AlertView.swift
//  Aula01Noite
//
//  Created by Student04 on 05/04/23.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        ZStack {
            Image("truck")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text("Bem vindo, Fulano")
                    .font(.largeTitle)
                Text("Fulano")
                    .padding()
                
                Spacer()
                
                Button {
                    //print("Alerta!")
                } label: {
                    Text("Entrar")
                        .padding()
                }
                .contentShape(Rectangle())
            }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
