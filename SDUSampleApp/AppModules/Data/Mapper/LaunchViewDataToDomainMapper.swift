//
//  LaunchViewDataToDomainMapper.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation

struct LaunchViewDataToDomainMapper: DataToDomainMapperProtocol {
    
    func transform<T, S>(data: T) -> S {
        
        let screenDto  = data as! ScreenDomainResponse
        return screenDto as! S
    }
}
