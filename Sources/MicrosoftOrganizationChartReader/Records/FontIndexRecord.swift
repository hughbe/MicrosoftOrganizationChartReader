//
//  FontIndexRecord.swift
//  
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct FontIndexRecord {
    public let index: UInt16
    public let unknown: UInt16
    
    public init(dataStream: inout DataStream) throws {
        self.index = try dataStream.read(endianess: .littleEndian)
        self.unknown = try dataStream.read(endianess: .littleEndian)
    }
}
