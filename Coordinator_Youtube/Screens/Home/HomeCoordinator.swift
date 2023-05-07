//
//  HomeCoordinator.swift
//  Coordinator_Youtube
//
//  Created by Ahmed Fathy on 11/03/2023.
//

import UIKit

protocol HomeTranstionDelegate: AnyObject {
    func goSettings(data: String)
}

protocol HomeChildDelagates: AnyObject {
    func didFinish(_ coordinator: Coordinator)
}

class HomeCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigaionController: UINavigationController
    
    // Constructor
    init(navigaionController: UINavigationController){
        self.navigaionController = navigaionController
    }
    
    deinit {
        print("deinit \(Self.self)")
    }
    
    func start() {
        let controller = HomeController()
        // Property injection
        controller.coordinator = self
        navigaionController.pushViewController(controller, animated: true)
    }
    
    
}
// Controller == Coordiantor
extension HomeCoordinator: HomeTranstionDelegate {
    // Constructor Injection / initialize
    // Property Injection
    // Method Injection
    
    func goSettings(data: String) {
        // --> Data
        let settingCoordinator = SettingsCoordinator(navigaionController: navigaionController, data: data)
        settingCoordinator.parentCoordinator = self
        childCoordinators.append(settingCoordinator)
        settingCoordinator.start()
    }
}

extension HomeCoordinator: HomeChildDelagates {
    // MARK: - Method injection
    func didFinish(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { childCoordinator in
            childCoordinator === coordinator
        }){
            childCoordinators.remove(at: index)
            navigaionController.popViewController(animated: true)
        }
    }
}
