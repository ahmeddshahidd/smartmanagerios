//
//  EAHexagonButon.swift
//  Template
//
//  Created by alijabbar on 3/18/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

class EAHexagonButon: UIButton {


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let lineWidth: CGFloat = 5
        let path = self.roundedPolygonPath(rect: self.bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 0, rotationOffset: CGFloat(M_PI / 2.0))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.lineWidth = lineWidth
        mask.strokeColor = UIColor.clear.cgColor
        mask.fillColor = UIColor.white.cgColor
                
        self.layer.mask = mask
        
        
        
        self.clipsToBounds = true
        
//        let border = CAShapeLayer()
//        border.path = path.cgPath
//        border.lineWidth = lineWidth
//        border.strokeColor = UIColor.white.cgColor
//        border.fillColor = UIColor.clear.cgColor
//        self.layer.addSublayer(border)
    }
    
    internal func roundedPolygonPath(rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat, rotationOffset: CGFloat = 0)
        -> UIBezierPath {
            let path = UIBezierPath()
            let theta: CGFloat = CGFloat(2.0 * M_PI) / CGFloat(sides) // How much to turn at every corner
            let offset: CGFloat = cornerRadius * tan(theta / 2.0)     // Offset from which to start rounding corners
            let width = min(rect.size.width, rect.size.height)        // Width of the square
            
            let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
            
            // Radius of the circle that encircles the polygon
            // Notice that the radius is adjusted for the corners, that way the largest outer
            // dimension of the resulting shape is always exactly the width - linewidth
            let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
            
            // Start drawing at a point, which by default is at the right hand edge
            // but can be offset
            var angle = CGFloat(rotationOffset)
            
            let corner = CGPoint(x:center.x + (radius - cornerRadius) * cos(angle), y:center.y + (radius - cornerRadius) * sin(angle))
            path.move(to: CGPoint(x:corner.x + cornerRadius * cos(angle + theta), y:corner.y + cornerRadius * sin(angle + theta)))
            
            for _ in 0 ..< sides {
                angle += theta
                
                let corner = CGPoint(x:center.x + (radius - cornerRadius) * cos(angle), y:center.y + (radius - cornerRadius) * sin(angle))
                let tip = CGPoint(x:center.x + radius * cos(angle), y:center.y + radius * sin(angle))
                let start = CGPoint(x:corner.x + cornerRadius * cos(angle - theta), y:corner.y + cornerRadius * sin(angle - theta))
                let end = CGPoint(x:corner.x + cornerRadius * cos(angle + theta), y:corner.y + cornerRadius * sin(angle + theta))
                
                path.addLine(to:start)
                path.addQuadCurve(to: end, controlPoint: tip)
            }
            
            path.close()
            
            // Move the path to the correct origins
            let bounds = path.bounds
            let transform = CGAffineTransform(translationX: -bounds.origin.x + rect.origin.x + lineWidth / 2.0, 
                                              y: -bounds.origin.y + rect.origin.y + lineWidth / 2.0)
            path.apply(transform)
            
            return path
    }
    
    


}
