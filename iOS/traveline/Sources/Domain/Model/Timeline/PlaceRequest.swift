//
//  TimelinePlaceRequest.swift
//  traveline
//
//  Created by KiWoong Hong on 2023/12/05.
//  Copyright © 2023 traveline. All rights reserved.
//

import Foundation

struct PlaceRequest {
    let place: String
    let offset: Int?
    let limit: Int?
    
    init(place: String, offset: Int? = nil, limit: Int? = nil) {
        self.place = place
        self.offset = offset
        self.limit = limit
    }
}
