//
//  OrganizationChartFontSection.swift
//  
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct OrganizationChartFontSection {
    public let records: [OrganizationChartRecord]
    
    public init(dataStream: inout DataStream) throws {
        var records: [OrganizationChartRecord] = []
        while true {
            let (id, data) = try dataStream.readOrganizationChartRecord()
            guard id != OrganizationChartRecordId.fontSectionEnd.rawValue else {
                break
            }
            
            records.append(try OrganizationChartRecord(id: id, data: data, dataStream: &dataStream))
        }
        
        self.records = records
    }
}
