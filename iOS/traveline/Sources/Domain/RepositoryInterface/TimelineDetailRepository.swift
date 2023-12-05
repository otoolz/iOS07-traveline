//
//  TimelineDetailRepository.swift
//  traveline
//
//  Created by KiWoong Hong on 2023/12/02.
//  Copyright © 2023 traveline. All rights reserved.
//

import Foundation

protocol TimelineDetailRepository {
    func fetchTimelineDetailInfo(id: String) async throws -> TimelineDetailInfo
    func createTimelineDetail(with timelineRequest: TimelineDetailRequest) async throws -> TimelineDetailInfo
    func requestLocationSearchResults(with data: PlaceRequest) async throws -> PlaceList
}
