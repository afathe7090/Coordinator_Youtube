//
//  AppCoordinator.swift
//  Coordinator_Youtube
//
//  Created by Ahmed Fathy on 11/03/2023.
//

import UIKit

class AppCoordinator: Coordinator  {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController = UINavigationController()
    
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigaionController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
