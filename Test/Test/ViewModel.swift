//
//  ViewModel.swift
//  Test
//
//  Created by Victor Hugo S on 04/06/24.
//

import Foundation

class ViewModel {
    
    func getAlbums(completion: @escaping ([Album]) -> Void) {
        NetworkManager().getAlbums { (albums: [Album]) in
            DispatchQueue.main.async {
                completion(albums)
            }
        }
        
        // cramirez@altimetrik.com
    }
}
