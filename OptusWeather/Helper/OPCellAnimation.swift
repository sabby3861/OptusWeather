//
//  OPCellAnimation.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func animateCell(scale: CGFloat) {
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
        UIView.animate(withDuration: 0.4) {
            self.transform = CGAffineTransform.identity
        }
    }
}
