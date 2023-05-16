//
//  Font+Extansions.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 13/05/23.
//

import SwiftUI

extension Font {
    
    static func appFontRegular(size: CGFloat) -> Font {
        return Font.custom("urbanist-regular", size: size)
    }
    
    static func appFontSemiBold(size: CGFloat) -> Font {
        return Font.custom("urbanist-semibold", size: size)
    }
    
    static func appFontBold(size: CGFloat) -> Font {
        return Font.custom("urbanist-bold", size: size)
    }
    
}
