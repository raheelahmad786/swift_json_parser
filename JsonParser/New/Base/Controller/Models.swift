//
//  Models.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import Foundation

// An Abstract Model
protocol Modelable {}

// Codable Model Protocol
protocol CodableModel: Modelable, Codable {}
