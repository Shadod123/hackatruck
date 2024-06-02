//
//  ContentView.swift
//  Aula10Noite
//
//  Created by Student04 on 18/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var jsonText: String = ""
    
    var body: some View {
        VStack {
            Text(jsonText)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding()
        .onAppear {
            fetchJSON()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
