//
//  PlaceResponseDTO.swift
//  traveline
//
//  Created by KiWoong Hong on 2023/12/05.
//  Copyright © 2023 traveline. All rights reserved.
//

import Foundation

typealias PlaceListResponseDTO = [PlaceResponseDTO]

struct PlaceResponseDTO: Decodable {
    let addressName: String
    let coordX: String
    let coordY: String
}

extension PlaceResponseDTO {
    func toDomain() -> Place {
        .init(
            location: addressName,
            coordX: Double(coordX),
            coordY: Double(coordY)
        )
    }
}
