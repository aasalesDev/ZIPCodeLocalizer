//
//  ViewController.swift
//  ZipCodeLocalizer
//
//  Created by Anderson Sales on 15/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    private var viewModel: AddressViewModel?
    private var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddressViewModel()
        alert = Alert(controller: self)
        
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        if let vc = UIStoryboard(name: String(describing: ResultVC.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ResultVC.self)) as? ResultVC {
            
            ServiceManager().getDataWithURLSession(zip: searchTextField.text ?? "") { result, failure in
                if let apiResponse = result {
                    
                    DispatchQueue.main.async {
                        self.viewModel?.saveAddress(address: apiResponse)
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.alert?.showAlert(title: "Attention", message: "Something went wrong, please check your entries!")
                    }
                }
                
            }
        }
    }
}

