//
//  SwiftUIView.swift
//  Aula10Noite
//
//  Created by Student04 on 19/04/23.
//

import SwiftUI

struct SwiftUIView: View {
    @StateObject var viewEstacionamento = ViewModelApi()
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                Spacer()
                    Text(viewEstacionamento.estacionamento.nomeEstacionamento ?? "")
                }
            }
        }
        .navigationTitle("Estacionamento")
        .padding()
        .onAppear {
            viewEstacionamento.fetch()
        }
    }
    
    func fetchJSON() {
        guard let url = URL(string: "http://127.0.0.1:1880/retrieveparkinglotcera") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response: \(response.debugDescription)")
                return
            }
            
            guard let data = data,
                  let jsonString = String(data: data, encoding: .utf8) else {
                print("No data received from the API")
                return
            }
            
            DispatchQueue.main.async {
                jsonText = jsonString
            }
        }
        
        task.resume()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

