//
//  CodableExtension.swift
//  GlobalMagnitude
//
//  Created by Matthew Jaffa on 1/11/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import Foundation

extension Encodable {
    func toDictionary() throws -> [String : Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] else {
            throw NSError()
        }
        
        return dictionary
    }
}
