//
//  Services.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import Foundation
import Alamofire

protocol AFRequestable {
    var url: String {get set}
}

struct AFGetRequest: AFRequestable {
    var url: String
}

final class AFService<I: AFRequestable, M: CodableModel>: AsyncServiceable {
    typealias Input = I
    typealias Output = M
    private var input: I
    private var output: M!
    init(input: I) {
        self.input = input
    }
    func perform() async throws -> M {
        return try await withCheckedThrowingContinuation({ (cont: CheckedContinuation<Output, Error>) in
            AF.request(input.url)
              .validate()
              .responseDecodable(of: M.self) { (response) in
                guard let films = response.value else {
                    if let err = response.error {
                        cont.resume(throwing: err)
                    }
                    else {
                        cont.resume(throwing: NSError(domain: "Unknown Decoding Error", code: 1))
                    }
                    return
                }
                  cont.resume(returning: films)
              }
        })
    }
}

