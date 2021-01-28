//
//  ShapeColorRecord.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct ShapeColorRecord {
    public let size: UInt16
    public let unknown1: UInt16
    public let color: (red: UInt8, blue: UInt8, green: UInt8, unused: UInt8)
    public let unknown2: UInt16
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.unknown1 = try dataStream.read(endianess: .littleEndian)
        
        self.color = (
            red: try dataStream.read(endianess: .littleEndian),
            blue: try dataStream.read(endianess: .littleEndian),
            green: try dataStream.read(endianess: .littleEndian),
            unused: try dataStream.read(endianess: .littleEndian)
        )

        self.unknown2 = try dataStream.read(endianess: .littleEndian)
    }
}
