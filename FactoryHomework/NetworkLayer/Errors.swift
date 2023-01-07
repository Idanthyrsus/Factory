//
//  Errors.swift
//  FactoryHomework
//
//  Created by Alexander Korchak on 31.12.2022.
//

import Foundation

enum NetworkError: Error {
    case custom(String)
    case emptyData
    case wrongJson(String)
}
