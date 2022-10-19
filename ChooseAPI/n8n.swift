//
//  n8n.swift
//  ChooseAPI
//
//  Created by Dhaval Bhimani on 2022-10-18.
//

import Foundation

class n8n {
    static private let urlString = "https://n8n.io/";
    
    static private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static public func fetchDir(){
        print(#function)
        guard
            let url = URL(string: urlString)
        else{
            preconditionFailure("was not able to convert string to url: \(urlString)")
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data)
                    
                    print(jsonData)
                }catch let err{
                    print("\(err)")
                }
            } else if let error = error {
                print("error with data task, fetchDir: \(error)")
            } else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
    }
}
