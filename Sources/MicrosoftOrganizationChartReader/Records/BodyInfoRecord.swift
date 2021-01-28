//
//  BodyInfoRecord.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct BodyInfoRecord {
    public let size: UInt16
    public let unknown1: UInt16
    public let unknown2: UInt16
    public let unknown3: UInt16
    public let unknown4: UInt16
    public let unknown5: UInt16
    public let unknown6: UInt16
    public let unknown7: UInt16
    public let backgroundColor: (red: UInt8, blue: UInt8, green: UInt8)
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.unknown1 = try dataStream.read(endianess: .littleEndian)
        self.unknown2 = try dataStream.read(endianess: .littleEndian)
        self.unknown3 = try dataStream.read(endianess: .littleEndian)
        self.unknown4 = try dataStream.read(endianess: .littleEndian)
        self.unknown5 = try dataStream.read(endianess: .littleEndian)
        self.unknown6 = try dataStream.read(endianess: .littleEndian)
        self.unknown7 = try dataStream.read(endianess: .littleEndian)

        self.backgroundColor = (
            red: try dataStream.read(endianess: .littleEndian),
            blue: try dataStream.read(endianess: .littleEndian),
            green: try dataStream.read(endianess: .littleEndian)
        )
    }
}
