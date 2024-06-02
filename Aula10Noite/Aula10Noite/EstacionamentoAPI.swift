//
//  EstacionamentoAPI.swift
//  Aula10Noite
//
//  Created by Student04 on 18/04/23.
//

import Foundation

struct Estacionamento: Hashable, Decodable {
    let nomeEstacionamento: String?
    let endereco: String?
    let vagas: Int?
    let carros: [Carro]
}

struct Carro: Hashable, Decodable {
    let modelo: String?
    let ano: Int?
    let cor: String?
    let preco: Double?
}

class ViewModelApi: ObservableObject {
    @Published var estacionamento: Estacionamento?
    var endpoint = "http://127.0.0.1:1880/retrieveparkinglotcera"
    
    func fetch() {
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error==nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode(Estacionamento.self, from: data)
                DispatchQueue.main.async {
                    self?.estacionamento = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
