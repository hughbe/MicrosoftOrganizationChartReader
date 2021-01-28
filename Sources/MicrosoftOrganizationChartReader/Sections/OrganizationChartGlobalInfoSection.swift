//
//  OrganizationChartGlobalInfoSection.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct OrganizationChartGlobalInfoSection {
    public let records: [OrganizationChartRecord]
    
    public init(dataStream: inout DataStream) throws {
        var records: [OrganizationChartRecord] = []
        while true {
            let (id, data) = try dataStream.readOrganizationChartRecord()
            guard id != OrganizationChartRecordId.globalInfoSectionEnd.rawValue else {
                break
            }
            
            records.append(try OrganizationChartRecord(id: id, data: data, dataStream: &dataStream))
        }
        
        self.records = records
    }
}
