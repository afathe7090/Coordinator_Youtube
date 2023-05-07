//
//  SettingsCoordinator.swift
//  Coordinator_Youtube
//
//  Created by Ahmed Fathy on 11/03/2023.
//

import UIKit

protocol SettingsTranstionDelegate: AnyObject {
    func backHome()
}


class SettingsCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigaionController: UINavigationController
    
    weak var parentCoordinator: HomeChildDelagates?
    private var data: String
    
    init(navigaionController: UINavigationController, data: String){
        self.navigaionController = navigaionController
        self.data = data
    }
    
    deinit {
        print("deinit \(Self.self)")
    }
    
    func start() {
        let settingModel = SettingModel(data: data)
        let settingViewModel = SettingViewModel(data: settingModel)
        let controller = SettingsController(viewModel: settingViewModel)
        controller.coordinator = self
        navigaionController.pushViewController(controller, animated: true)
    }
}
extension SettingsCoordinator: SettingsTranstionDelegate{
    func backHome() {
        parentCoordinator?.didFinish(self)
    }
}
