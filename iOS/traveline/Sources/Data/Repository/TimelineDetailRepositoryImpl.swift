//
//  TimelineDetailRepositoryImpl.swift
//  traveline
//
//  Created by KiWoong Hong on 2023/12/02.
//  Copyright © 2023 traveline. All rights reserved.
//

import Foundation

final class TimelineDetailRepositoryImpl: TimelineDetailRepository {
    
    let network: NetworkType
    
    init(network: NetworkType) {
        self.network = network
    }
    
    func fetchTimelineDetailInfo(id: String) async throws -> TimelineDetailInfo {
        
        let testId = "01d97f2b-515c-4a44-91b8-dfa48d806b00"
        let timelineDetailResponseDTO = try await network.request(
            endPoint: TimelineDetailEndPoint.specificTimeline(testId),
            type: TimelineDetailResponseDTO.self
        )
        
        return timelineDetailResponseDTO.toDomain()
    }
    
    func createTimelineDetail(with info: TimelineDetailRequest) async throws -> TimelineDetailInfo {
        
        let timelineDetailResponseDTO = try await network.request(
            endPoint: TimelineDetailEndPoint.createTimeline(info.toDTO()),
            type: TimelineDetailResponseDTO.self
        )
        
        return timelineDetailResponseDTO.toDomain()
    }
    
}
