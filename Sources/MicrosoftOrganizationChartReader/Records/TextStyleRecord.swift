//
//  TextStyleRecord.swift
//
//
//  Created by Hugh Bellamy on 23/01/2021.
//

import DataStream

public enum TextStyleRecord {
    case fontStyle(_: TextInfoRecordDataFontStyle)
    case fontWeight(_: TextInfoRecordDataFontWeight)
    case textColor(_: TextInfoRecordDataTextColor)
    case textAlign(_: TextInfoRecordDataTextAlign)
    case fontSize(_: TextInfoRecordDataFontSize)
    case unknown(type: UInt16, _: DataStream)
    
    public init(dataStream: inout DataStream) throws {
        let typeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        guard let type = TextInfoRecordType(rawValue: typeRaw) else {
            self = .unknown(type: typeRaw, dataStream)
            return
        }

        switch type {
        case .fontStyle:
            self = .fontStyle(try TextInfoRecordDataFontStyle(dataStream: &dataStream))
        case .fontWeight:
            self = .fontWeight(try TextInfoRecordDataFontWeight(dataStream: &dataStream))
        case .textColor:
            self = .textColor(try TextInfoRecordDataTextColor(dataStream: &dataStream))
        case .textAlign:
            self = .textAlign(try TextInfoRecordDataTextAlign(dataStream: &dataStream))
        case .fontSize:
            self = .fontSize(try TextInfoRecordDataFontSize(dataStream: &dataStream))
        }
    }
    
    public enum TextInfoRecordType: UInt16, DataStreamCreatable {
        case fontStyle = 0x01
        case fontWeight = 0x02
        case textColor = 0x03
        case textAlign = 0x07
        case fontSize = 0x09
    }
    
    public struct TextInfoRecordDataFontStyle {
        public let style: FontStyle
        public let unknown2: UInt16
        public let unknown3: UInt16
        
        public init(dataStream: inout DataStream) throws {
            self.style = try FontStyle(dataStream: &dataStream)
            self.unknown2 = try dataStream.read(endianess: .littleEndian)
            self.unknown3 = try dataStream.read(endianess: .littleEndian)
        }
        
        public enum FontStyle: UInt16, DataStreamCreatable {
            case normal = 0x00
            case bold = 0x01
            case italic = 0x02
            case boldItalic = 0x03
        }
    }
    
    public struct TextInfoRecordDataFontWeight {
        public let weight: FontWeight
        public let unknown2: UInt16
        public let unknown3: UInt16
        
        public init(dataStream: inout DataStream) throws {
            self.weight = try FontWeight(dataStream: &dataStream)
            self.unknown2 = try dataStream.read(endianess: .littleEndian)
            self.unknown3 = try dataStream.read(endianess: .littleEndian)
        }
        
        public enum FontWeight: UInt16, DataStreamCreatable {
            case normal = 0x00
            case narrow = 0x01
            case black = 0x02
            case unknown0x03 = 0x03
            case medium = 0x04
        }
    }
    
    public struct TextInfoRecordDataTextColor {
        public let color: (red: UInt8, blue: UInt8, green: UInt8, unused: UInt8)
        public let unknown: UInt16
        
        public init(dataStream: inout DataStream) throws {
            self.color = (
                red: try dataStream.read(endianess: .littleEndian),
                blue: try dataStream.read(endianess: .littleEndian),
                green: try dataStream.read(endianess: .littleEndian),
                unused: try dataStream.read(endianess: .littleEndian)
            )

            self.unknown = try dataStream.read(endianess: .littleEndian)
        }
    }
    
    public struct TextInfoRecordDataTextAlign {
        public let textAlign: UInt32
        public let unknown3: UInt16
        
        public init(dataStream: inout DataStream) throws {
            self.textAlign = try dataStream.read(endianess: .littleEndian)
            self.unknown3 = try dataStream.read(endianess: .littleEndian)
        }
        
        public enum TextAlign: UInt32, DataStreamCreatable {
            case left = 0x00
            case center = 0x01
            case right = 0x02
        }
    }
    
    public struct TextInfoRecordDataFontSize {
        public let size: UInt16
        public let unknown2: UInt16
        public let unknown3: UInt16
        
        public init(dataStream: inout DataStream) throws {
            self.size = try dataStream.read(endianess: .littleEndian)
            self.unknown2 = try dataStream.read(endianess: .littleEndian)
            self.unknown3 = try dataStream.read(endianess: .littleEndian)
        }
    }
}
