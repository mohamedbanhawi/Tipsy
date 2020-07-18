//
//  Bill.swift
//  Tipsy
//
//  Created by Mohamed Elbanhawi on 17/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    
    var total: Float?
    var tipPct: Float?
    var split: Int?
    
    func calculatePayment()-> Float {
        return (total!*(100 + tipPct!)/100.0) / Float(split!)
    }
}
