//
//  DataStreamCreatable.swift
//  
//
//  Created by Hugh Bellamy on 30/11/2020.
//

import DataStream

internal protocol DataStreamCreatable {
    init(dataStream: inout DataStream) throws
}

extension DataStreamCreatable where Self: RawRepresentable, Self.RawValue: FixedWidthInteger {
    init(dataStream: inout DataStream) throws {
        let rawValue: Self.RawValue = try dataStream.read(endianess: .littleEndian)
        guard let value = Self(rawValue: rawValue) else {
            throw OrganizationChartReadError.corrupted
        }
        
        self = value
    }
}
