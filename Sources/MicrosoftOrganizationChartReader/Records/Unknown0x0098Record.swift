//
//  Unknown0x0098Record.swift
//  
//
//  Created by Hugh Bellamy on 25/01/2021.
//

import DataStream

public struct Unknown0x0098Record {
    public let size: UInt16
    public let unknown: UInt16
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.unknown = try dataStream.read(endianess: .littleEndian)
    }
}
