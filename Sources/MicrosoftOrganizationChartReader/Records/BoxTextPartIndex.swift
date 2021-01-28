//
//  BoxTextPartIndex.swift
//
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public enum BoxTextPartIndex: UInt16, DataStreamCreatable {
    case name = 0x00
    case title = 0x01
    case comment1 = 0x02
    case comment2 = 0x03
}
