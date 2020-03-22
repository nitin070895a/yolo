//
//  Trip.swift
//  Yolo
//
//  Created by Nitin Khurana on 22/03/20.
//  Copyright © 2020 Nitin Khurana. All rights reserved.
//

import Foundation

public struct Trip {
    
    public var to: String;
    public var from: String;
    
    init(_ to: String,_ from: String) {
        self.to = to;
        self.from = from
    }
}
