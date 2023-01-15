//
//  AddressViewModel.swift
//  ZipCodeLocalizer
//
//  Created by Anderson Sales on 15/01/23.
//

import Foundation

class AddressViewModel {
    
    private static var address: Address?
    
    func saveAddress(address: Address) {
        AddressViewModel.address = address
    }
    
    func getAddress() -> Address? {
        return AddressViewModel.address
    }
    
}
