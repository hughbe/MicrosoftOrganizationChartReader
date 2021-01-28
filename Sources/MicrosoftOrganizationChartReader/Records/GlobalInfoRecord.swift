//
//  GlobalInfoRecord.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct GlobalInfoRecord {
    public let unknown1: UInt16
    public let unknown2: UInt16
    public let unknown3: UInt16
    public let unknown4: UInt16
    public let unknown5: UInt16
    public let unknown6: UInt16
    public let unknown7: UInt16
    public let groupsStyle: GroupsStyle
    public let unknown8: UInt16
    
    public init(dataStream: inout DataStream) throws {
        self.unknown1 = try dataStream.read(endianess: .littleEndian)
        self.unknown2 = try dataStream.read(endianess: .littleEndian)
        self.unknown3 = try dataStream.read(endianess: .littleEndian)
        self.unknown4 = try dataStream.read(endianess: .littleEndian)
        self.unknown5 = try dataStream.read(endianess: .littleEndian)
        self.unknown6 = try dataStream.read(endianess: .littleEndian)
        self.unknown7 = try dataStream.read(endianess: .littleEndian)
        self.groupsStyle = try GroupsStyle(dataStream: &dataStream)
        self.unknown8 = try dataStream.read(endianess: .littleEndian)
    }
    
    public enum GroupsStyle: UInt16, DataStreamCreatable {
        case style1 = 0x00
        case style2 = 0x02
        case style3 = 0x03
        case style4 = 0x04
        case style5 = 0x05
        case coManager = 0x22
    }
}
