//
//  TitlePartIndex.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public enum TitlePartIndex: UInt16, DataStreamCreatable {
    case unknown0x00 = 0x00
    case title = 0x01
    case unknown0x02 = 0x02
    case unknown0x03 = 0x03
    case unknown0x04 = 0x04
    case unknown0x05 = 0x05
}
