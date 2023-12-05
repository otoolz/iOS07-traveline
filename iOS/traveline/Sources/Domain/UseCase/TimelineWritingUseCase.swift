//
//  TimelineWritingUseCase.swift
//  traveline
//
//  Created by KiWoong Hong on 2023/12/02.
//  Copyright © 2023 traveline. All rights reserved.
//

import Combine
import Foundation

protocol TimelineWritingUseCase {
    func requestCreateTimeline(with info: TimelineDetailRequest) -> AnyPublisher<TimelineDetailInfo, Error>
    func requestLocationSearchList(with text: String) -> AnyPublisher<PlaceList, Error>
}

final class TimelineWritingUseCaseImpl: TimelineWritingUseCase {
    
    private let repository: TimelineDetailRepository
    
    init(repository: TimelineDetailRepository) {
        self.repository = repository
    }
    
    func requestCreateTimeline(with info: TimelineDetailRequest) -> AnyPublisher<TimelineDetailInfo, Error> {
        return Future { promise in
            Task {
                do {
                    let timelineDetailInfo = try await self.repository.createTimelineDetail(with: info)
                    promise(.success(timelineDetailInfo))
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func requestLocationSearchList(with text: String) -> AnyPublisher<PlaceList, Error> {
        return Future { promise in
            Task {
                do {
                    let locationSearchResults = try await self.repository.requestLocationSearchResults(with: .init(place: text))
                    promise(.success(locationSearchResults))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
