//
//  NetworkManager.swift
//  Test
//
//  Created by Victor Hugo S on 04/06/24.
//

import Foundation

class NetworkManager {
    
    func getAlbums(completion: @escaping ([Album]) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/photos"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = urlSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            do {
                let albumsArray = try JSONDecoder().decode([Album].self, from: data!)
                print("albumsArray: \(albumsArray)")
                completion(albumsArray)
            } catch let error {
                completion([])
                print("catcherror: \(error)")
            }
        }
        task.resume()
    }
}


struct Album: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
