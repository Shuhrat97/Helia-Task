//
//  Color+Extensions.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 13/05/23.
//

import SwiftUI

extension Color {
    static let appGreen = Color(UIColor(hex: "#1AB65C"))
    static let backgroundColor = Color(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1))
    static let grayTextColor = Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1))
}


extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        if hexString.count != 6 {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}
