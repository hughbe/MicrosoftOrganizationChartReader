//
//  ShadowInfoRecord.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct ShadowRecord {
    public let size: UInt16
    public let type: ShadowType
    public let height: UInt16
    public let width: UInt16
    public let fillColor: (red: UInt8, blue: UInt8, green: UInt8, unused: UInt8)
    public let color: (red: UInt8, blue: UInt8, green: UInt8, unused: UInt8)

    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.type = try ShadowType(dataStream: &dataStream)
        self.height = try dataStream.read(endianess: .littleEndian)
        self.width = try dataStream.read(endianess: .littleEndian)
        self.fillColor = (
            red: try dataStream.read(endianess: .littleEndian),
            blue: try dataStream.read(endianess: .littleEndian),
            green: try dataStream.read(endianess: .littleEndian),
            unused: try dataStream.read(endianess: .littleEndian)
        )
        self.color = (
            red: try dataStream.read(endianess: .littleEndian),
            blue: try dataStream.read(endianess: .littleEndian),
            green: try dataStream.read(endianess: .littleEndian),
            unused: try dataStream.read(endianess: .littleEndian)
        )
    }
    
    public enum ShadowType: UInt16, DataStreamCreatable {
        case none = 0x00
        case sideAndBottom = 0x01 // Left/Bottom and Right/Bottom
        case sideAndBottomBevel = 0x02 // Left/Bottom/Bevel and Right/Bottom/Bevel
        case topOrBottom = 0x03
        case leftBottomRight = 0x04
        case topBottomLeftRightBevel = 0x05 // Not documented
        case topBottomLeftRight = 0x06 // Not documented
        case topRight = 0x07 // Not documented
        case leftBottom = 0x08 // Not documented
        case inset = 0x09 // Not documented
    }
}
