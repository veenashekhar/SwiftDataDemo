//
//  Item.swift
//  SwiftDataDemo
//
//  Created by Veena Shekhar on 22/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
