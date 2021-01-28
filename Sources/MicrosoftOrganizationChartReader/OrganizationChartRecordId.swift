//
//  OrganizationChartRecordId.swift
//  
//
//  Created by Hugh Bellamy on 20/01/2021.
//

import DataStream

public enum OrganizationChartRecordId: UInt16, DataStreamCreatable {
    // Structure.
    case unknown0x0001 = 0x0001
    case unknown0x0002 = 0x0002
    case unknown0x0003 = 0x0003
    case footer = 0x0FFF
    
    // Containers.
    case parentSectionStart = 0x4001
    case parentSectionEnd = 0x6001
    case containerSectionStart = 0x4002
    case containerSectionEnd = 0x6002

    // Global info
    case globalInfoSectionStart = 0x4005
    case globalInfo = 0x0FFD
    case globalInfoSectionEnd = 0x6005
    
    // Canvas
    case canvasSectionStart = 0x4003
    case bodyInfo = 0x0020
    case canvasSectionEnd = 0x6003
    
    // Levels.
    case levelsSectionStart = 0x4006
    case level = 0x0041
    case levelSectionStart = 0x4007
    case boxIndex = 0x0050
    case levelSectionEnd = 0x6007
    case linesSectionStart = 0x400C
    case linesSectionEnd = 0x600C
    case levelsSectionEnd = 0x6006
    
    // Box Text.
    case boxTextPartsSectionStart = 0x4008
    case boxTextPartCount = 0x0010
    case boxTextPartIndex = 0x0011
    case boxTextPartType = 0x0012
    case boxTextPartsSectionEnd = 0x6008
    
    // Text
    case text = 0x0060
    case textStyleSectionStart = 0x4010
    case textStyle = 0x0061
    case textStyleSectionEnd = 0x6010
    
    // Title
    case titleSectionStart = 0x4009
    case titlePartIndex = 0x0026
    case titleSectionEnd = 0x6009
    
    // Font
    case fontSectionStart = 0x400B
    case fontIndex = 0x009C
    case fontName = 0x0025
    case fontSectionEnd = 0x600B
    
    // Shapes
    case shapesSectionStart = 0x400E
    case shape = 0x0083
    case shapeColor = 0x0084
    case shapesSectionEnd = 0x600E
    
    // Common
    case border = 0x0053
    case line = 0x0056
    case selected = 0x0088
    case shadow = 0x0092
    
    // Connectors
    case connectorsSectionStart = 0x4012
    case connector = 0x0055
    case connectorsSectionEnd = 0x6012

    // Unknown
    case unknown0x0021 = 0x0021 // ?
    case unknown0x0022 = 0x0022 // ?
    case unknown0x0023 = 0x0023 // ?
    case unknown0x0024 = 0x0024 // ?
    case unknown0x0042 = 0x0042 // ?
    case unknown0x0051 = 0x0051 // ?
    case unknown0x0052 = 0x0052 // ?
    case unknown0x0054 = 0x0054 // ?
    case unknown0x0093 = 0x0093 // ?
    case unknown0x0094 = 0x0094 // ?
    case unknown0x0095 = 0x0095 // ?
    case unknown0x0096 = 0x0096 // ?
    case unknown0x0097 = 0x0097 // ?
    case unknown0x0098 = 0x0098 // ?
    case unknown0x009B = 0x009B // ?

    case unknown0x400A = 0x400A
    case unknown0x600A = 0x600A // ?
}
