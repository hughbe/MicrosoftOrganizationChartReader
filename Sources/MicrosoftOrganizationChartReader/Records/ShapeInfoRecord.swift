//
//  ShapeRecord.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public struct ShapeRecord {
    public let size: UInt16
    public let type: ShapeType
    public let x: UInt32
    public let y: UInt32
    public let width: UInt16
    public let height: UInt16
    public let unknown2: UInt32
    
    public init(dataStream: inout DataStream) throws {
        self.size = try dataStream.read(endianess: .littleEndian)
        self.type = try ShapeType(dataStream: &dataStream)
        self.y = try dataStream.read(endianess: .littleEndian)
        self.x = try dataStream.read(endianess: .littleEndian)
        self.width = try dataStream.read(endianess: .littleEndian)
        self.height = try dataStream.read(endianess: .littleEndian)
        self.unknown2 = try dataStream.read(endianess: .littleEndian)
    }
    
    public enum ShapeType: UInt16, DataStreamCreatable {
        case rectangle = 0x01
        case text = 0x02
        case horizontalLine = 0x03
        case verticalLine = 0x04
        case customLine = 0x05 // Line with custom thickness
    }
}
