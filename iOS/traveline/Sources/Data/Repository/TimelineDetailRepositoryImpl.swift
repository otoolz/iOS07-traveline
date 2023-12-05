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
        
        let timelineDetailResponseDTO = try await network.request(
            endPoint: PostingEndPoint.specificPosting,
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
    
    func requestLocationSearchResults(with data: PlaceRequest) async throws -> PlaceList {
        let placeListReqeustDTO = try await network.request(
            endPoint: TimelineDetailEndPoint.requestLocationList(data.toDTO()),
            type: PlaceListResponseDTO.self
        )
        
        return placeListReqeustDTO.map { $0.toDomain() }
    }
    
}
