//
//  SettingsController.swift
//  Coordinator_Youtube
//
//  Created by Ahmed Fathy on 11/03/2023.
//

import UIKit

class SettingViewModel {
    var data: SettingModel
    
    init(data: SettingModel) {
        self.data = data
    }
    
}

struct SettingModel  {
    var data: String
}

class SettingsController: UIViewController {

    weak var coordinator: SettingsTranstionDelegate?
    private var viewModel: SettingViewModel!
    
    convenience init(viewModel: SettingViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.data)
    }

    @IBAction func actionHome(_ sender: UIButton) {
        coordinator?.backHome()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
