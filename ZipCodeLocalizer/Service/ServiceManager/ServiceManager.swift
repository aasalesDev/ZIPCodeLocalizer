//
//  ServiceManager.swift
//  ZipCodeLocalizer
//
//  Created by Anderson Sales on 15/01/23.
//

import Foundation

protocol ServiceManagerProtocol: GenericService {
    func getDataWithURLSession(zip: String, completion: @escaping completion<Address?>)
}

class ServiceManager: ServiceManagerProtocol {
    
    func getDataWithURLSession(zip: String, completion: @escaping completion<Address?>) {
        let baseUrl = "https://cep.awesomeapi.com.br/json/"
        let urlString: String = baseUrl + zip
        guard let url: URL = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let apiResponse: Address = try JSONDecoder().decode(Address.self, from: dataResult)
                    completion(apiResponse, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
