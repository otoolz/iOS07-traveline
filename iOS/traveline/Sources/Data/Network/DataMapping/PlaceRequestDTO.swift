//
//  PlaceRequestDTO.swift
//  traveline
//
//  Created by KiWoong Hong on 2023/12/05.
//  Copyright © 2023 traveline. All rights reserved.
//

import Foundation

struct PlaceRequestDTO: Encodable {
    let place: String
    let offset: Int?
    let limit: Int?
}

extension PlaceRequest {
    func toDTO() -> PlaceRequestDTO {
        .init(
            place: place,
            offset: offset,
            limit: limit
        )
    }
    
}
