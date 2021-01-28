//
//  BoxTextPartType.swift
//  
//
//  Created by Hugh Bellamy on 26/01/2021.
//

public enum BoxTextPartType: UInt16, DataStreamCreatable {
    case topLevel = 0x01 // E.g. Name, Title
    case comment = 0x02 // E.g. Comment 1, Comment2
}
