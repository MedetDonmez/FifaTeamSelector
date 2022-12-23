//
//  UIColor+Extensions.swift
//  Graphs
//
//  Created by fmss on 22.12.2022.
//

import UIKit

extension UIColor {
    func lighterColor(by percentage: CGFloat = 0.2) -> UIColor? {
        return self.adjust(by: abs(percentage))
    }

    func darkerColor(by percentage: CGFloat = 0.2) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage))
    }

    private func adjust(by percentage: CGFloat = 0.2) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage, 1.0),
                           green: min(green + percentage, 1.0),
                           blue: min(blue + percentage, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
