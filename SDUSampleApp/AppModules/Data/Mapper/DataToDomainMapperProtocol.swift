//
//  DataToDomainMapperProtocol.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation
protocol DataToDomainMapperProtocol {
    
    func transform<T, S>(data: T) -> S
}
