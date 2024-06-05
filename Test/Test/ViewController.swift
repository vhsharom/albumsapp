//
//  ViewController.swift
//  Test
//
//  Created by Victor Hugo S on 04/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlbums { [weak self] (albums: [Album]) in
            guard let self = self else { return }
            
            if let firstAlbum = albums.first {
                self.titleLabel.text = firstAlbum.title
            }
        }
    }
}

