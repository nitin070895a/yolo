//
//  CollectionViewCell.swift
//  Yolo
//
//  Created by Nitin Khurana on 22/03/20.
//  Copyright © 2020 Nitin Khurana. All rights reserved.
//

import UIKit

class TripCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    public func load(trip: Trip) {
        from.text = trip.from
        to.text = trip.to
        
        image.tintColor = UIColor.init(hexString: THEME_COLOR)
    }
}
