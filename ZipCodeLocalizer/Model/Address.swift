//
//  Address.swift
//  ZipCodeLocalizer
//
//  Created by Anderson Sales on 15/01/23.
//

import Foundation

struct Address: Codable {
    let cep: String
    let address_type: String
    let address_name: String
    let address: String
    let district: String
    let state: String
    let city: String
    let lat: String
    let lng: String
    let ddd: String
    let city_ibge: String
}
