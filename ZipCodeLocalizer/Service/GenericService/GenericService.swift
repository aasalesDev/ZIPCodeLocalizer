//
//  GenericService.swift
//  ZipCodeLocalizer
//
//  Created by Anderson Sales on 15/01/23.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
