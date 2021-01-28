//
//  FooterRecord.swift
//  
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct FooterRecord {
    public let size: UInt16
    public let crc: UInt32
    public let fileSize: UInt32
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.crc = try dataStream.read(endianess: .littleEndian)
        self.fileSize = try dataStream.read(endianess: .littleEndian)
    }
}
