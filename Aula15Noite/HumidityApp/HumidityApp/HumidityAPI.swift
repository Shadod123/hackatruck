//
//  HumidityAPI.swift
//  Aula10Noite
//
//  Created by Student04 on 18/04/23.
//

import Foundation

struct Umidade: Hashable, Decodable {
    let nomeEstacionamento: Float?
}

class ViewModelApi: ObservableObject {
    @Published var umidade: Umidade?
    var endpoint = "http://127.0.0.1:1880/retrievehumiditycera"
    
    func fetch() {
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error==nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode(Umidade.self, from: data)
                DispatchQueue.main.async {
                    self?.umidade = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

