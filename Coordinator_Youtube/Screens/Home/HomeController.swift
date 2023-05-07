//
//  HomeController.swift
//  Coordinator_Youtube
//
//  Created by Ahmed Fathy on 11/03/2023.
//

import UIKit

class HomeController: UIViewController {
    
    weak var coordinator: HomeTranstionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func actionSettings(_ sender: UIButton) {
        // send data
        coordinator?.goSettings(data: "Welcome Coordinator")        
    }
    
}
