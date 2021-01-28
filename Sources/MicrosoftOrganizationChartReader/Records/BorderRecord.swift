//
//  BorderRecord.swift
//  
//
//  Created by Hugh Bellamy on 23/01/2021.
//

import DataStream

public struct BorderRecord {
    public let size: UInt16
    public let style: Style
    public let unknown1: UInt16
    public let unknown2: UInt16
    public let lineStyle: LineStyle
    public let borderColor: (red: UInt8, blue: UInt8, green: UInt8, unused: UInt8)
    public let unknown3: UInt16
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.style = try Style(dataStream: &dataStream)
        self.unknown1 = try dataStream.read(endianess: .littleEndian)
        self.unknown2 = try dataStream.read(endianess: .littleEndian)
        self.lineStyle = try LineStyle(dataStream: &dataStream)

        self.borderColor = (
            red: try dataStream.read(endianess: .littleEndian),
            blue: try dataStream.read(endianess: .littleEndian),
            green: try dataStream.read(endianess: .littleEndian),
            unused: try dataStream.read(endianess: .littleEndian)
        )
        
        self.unknown3 = try dataStream.read(endianess: .littleEndian)
    }
    
    public enum Style: UInt16, DataStreamCreatable {
        case none = 0x00
        case single1 = 0x01
        case hairline = 0x0A
        case single2 = 0x0C
        case single3 = 0x0D
        case single4 = 0x0E
        case double1 = 0x1F
        case double2 = 0x16
        case double3 = 0x29
        case double4 = 0x17
        case double5 = 0x33
        case double6 = 0x18
    }
}
