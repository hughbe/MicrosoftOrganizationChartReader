//
//  Unknown0x0042Record.swift
//
//
//  Created by Hugh Bellamy on 25/01/2021.
//

import DataStream

public struct Unknown0x0042Record {
    public let size: UInt16
    public let unknown: [UInt8]
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.unknown = try dataStream.readBytes(count: 16)
    }
}
