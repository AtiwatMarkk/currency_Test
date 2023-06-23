//
//  Service.swift
//  weather forecast test
//
//  Created by Tankhun on 12/5/2566 BE.
//

import Foundation

class Service {
    static let shared = Service()
    
    
    private init() {}
    
    
    func updatecurrency(completion: @escaping (ResponseData?, Error?) -> Void) {
        
        let urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
        
        if let url = URL(string: urlString) {
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("No data returned")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let Data = try decoder.decode(ResponseData.self, from: data)
                    completion(Data, nil)
                } catch {
                    completion(nil, error)
                }
            }
            
            task.resume()
        } else {
            completion(nil, nil)
        }
    }

    



    
}
