//
//  LineStyle.swift
//  
//
//  Created by Hugh Bellamy on 24/01/2021.
//

public enum LineStyle: UInt16, DataStreamCreatable {
    case solid = 0x01
    case dashed = 0x03
    case dashedWide = 0x04
}
