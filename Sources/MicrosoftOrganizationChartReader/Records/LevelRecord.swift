//
//  LevelRecord.swift
//
//
//  Created by Hugh Bellamy on 25/01/2021.
//

import DataStream

public struct LevelRecord {
    public let size: UInt16
    public let unknown1: UInt16
    public let unknown2: UInt16
    public let unknown3: UInt16
    public let unknown4: UInt16
    public let count: UInt16
    public let unknown5: UInt16
    public let unknown6: UInt16
    public let unknown8: UInt8
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.unknown1 = try dataStream.read(endianess: .littleEndian)
        self.unknown2 = try dataStream.read(endianess: .littleEndian)
        self.unknown3 = try dataStream.read(endianess: .littleEndian)
        self.unknown4 = try dataStream.read(endianess: .littleEndian)
        self.count = try dataStream.read(endianess: .littleEndian)
        self.unknown5 = try dataStream.read(endianess: .littleEndian)
        self.unknown6 = try dataStream.read(endianess: .littleEndian)
        self.unknown8 = try dataStream.read()
    }
}
