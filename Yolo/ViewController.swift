//
//  ViewController.swift
//  Yolo
//
//  Created by Nitin Khurana on 20/03/20.
//  Copyright © 2020 Nitin Khurana. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var today: UIButton!
    @IBOutlet weak var tomorrow: UIButton!
    
    @IBOutlet weak var recentTripsCollectionView: UICollectionView!
    @IBOutlet weak var availableTripsCollectionView: UICollectionView!
    
    // Data
    private var recentTrips: [Trip] = []
    private var availableTrips: [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        switchButton.layer.cornerRadius = 20
        
        today.setSelectedColor(color: "#12D369")
        tomorrow.setSelectedColor(color: "#12D369")
        
        apiStub()
    }
    
    // Acts as an api source
    private func apiStub() {
        
        recentTrips.append(Trip("Delhi", "Chandigarh"))
        recentTrips.append(Trip("Delhi", "Goa"))
        recentTrips.append(Trip("Delhi", "Rajasthan"))
        
        availableTrips.append(Trip("Delhi", "Chandigarh"))
        availableTrips.append(Trip("Delhi", "Goa"))
        availableTrips.append(Trip("Delhi", "Rajasthan"))
        
        availableTrips.append(Trip("Chandigarh", "Delhi"))
        availableTrips.append(Trip("Goa", "Delhi"))
        availableTrips.append(Trip("Rajasthan", "Delhi"))
        
        availableTrips.append(Trip("Chandigarh", "Goa"))
        availableTrips.append(Trip("Goa", "Chandigarh"))
        
        availableTrips.append(Trip("Chandigarh", "Rajasthan"))
        availableTrips.append(Trip("Rajasthan", "Chandigarh"))
        
        availableTrips.append(Trip("Rajasthan", "Goa"))
        availableTrips.append(Trip("Goa", "Rajasthan"))
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if(collectionView == recentTripsCollectionView) {
            return recentTrips.count
        } else {
            return availableTrips.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if (collectionView == recentTripsCollectionView) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentTripCollectionCell", for: indexPath) as! CollectionViewCell
            cell.load(trip: recentTrips[indexPath.row])
            return cell
            
        } else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvailableTripCollectionCell", for: indexPath) as! CollectionViewCell
            cell.load(trip: availableTrips[indexPath.row])
            return cell
        }
        
    }

}

