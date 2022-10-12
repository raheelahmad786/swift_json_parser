//
//  Service.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import Foundation

protocol Serviceable {
    associatedtype Input
    associatedtype Output: Modelable
    init(input: Input)
}
protocol CompletionServiceable: Serviceable {
    func perform(completion: @escaping (Output)->())
}
protocol AsyncServiceable: Serviceable {
    func perform() async throws -> Output
}
