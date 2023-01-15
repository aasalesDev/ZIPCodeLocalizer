//
//  ResultVC.swift
//  ZipCodeLocalizer
//
//  Created by Anderson Sales on 15/01/23.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var statementLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    private var vieModel: AddressViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vieModel = AddressViewModel()
        setupLabels()
    }
    
    func setupLabels() {
        cityLabel.text = vieModel?.getAddress()?.city
        statementLabel.text = "The city for zip \(vieModel?.getAddress()?.cep ?? "") is"
    }
    
}
