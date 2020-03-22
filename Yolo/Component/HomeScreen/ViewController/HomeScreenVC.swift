//
//  ViewController.swift
//  Yolo
//
//  Created by Nitin Khurana on 20/03/20.
//  Copyright © 2020 Nitin Khurana. All rights reserved.
//

import UIKit

class HomeScreenVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var today: UIButton!
    @IBOutlet weak var tomorrow: UIButton!
    @IBOutlet weak var currentDate: UILabel!
    
    @IBOutlet weak var recentTripsCollectionView: UICollectionView!
    @IBOutlet weak var availableTripsCollectionView: UICollectionView!
    
    // Data
    private var _recentTrips: [Trip] = []
    private var _availableTrips: [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        switchButton.layer.cornerRadius = 20
        recentTripsCollectionView.backgroundColor = UIColor.clear
        availableTripsCollectionView.backgroundColor = UIColor.clear
        
        today.setSelectedColor(color: THEME_COLOR)
        tomorrow.setSelectedColor(color: THEME_COLOR)
        
        apiStub()
        
        today.sendActions(for: .touchUpInside)
    }
    
    @IBAction func todayClicked(_ sender: Any) {
        currentDate.text = TimeAndDateUtils.today().formatToYoloDefault()
    }
    
    @IBAction func tomorrowClicked(_ sender: Any) {
        currentDate.text = TimeAndDateUtils.tomorrow().formatToYoloDefault()
    }
    
    // Acts as an api source
    private func apiStub() {
        
        _recentTrips.append(Trip("Delhi", "Chandigarh"))
        _recentTrips.append(Trip("Delhi", "Goa"))
        _recentTrips.append(Trip("Delhi", "Rajasthan"))
        
        _availableTrips.append(Trip("Delhi", "Chandigarh"))
        _availableTrips.append(Trip("Delhi", "Goa"))
        _availableTrips.append(Trip("Delhi", "Rajasthan"))
        
        _availableTrips.append(Trip("Chandigarh", "Delhi"))
        _availableTrips.append(Trip("Goa", "Delhi"))
        _availableTrips.append(Trip("Rajasthan", "Delhi"))
        
        _availableTrips.append(Trip("Chandigarh", "Goa"))
        _availableTrips.append(Trip("Goa", "Chandigarh"))
        
        _availableTrips.append(Trip("Chandigarh", "Rajasthan"))
        _availableTrips.append(Trip("Rajasthan", "Chandigarh"))
        
        _availableTrips.append(Trip("Rajasthan", "Goa"))
        _availableTrips.append(Trip("Goa", "Rajasthan"))
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if(collectionView == recentTripsCollectionView) {
            return _recentTrips.count
        } else {
            return _availableTrips.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if (collectionView == recentTripsCollectionView) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentTripCollectionCell", for: indexPath) as! TripCollectionCell
            cell.load(trip: _recentTrips[indexPath.row])
            return cell
            
        } else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvailableTripCollectionCell", for: indexPath) as! TripCollectionCell
            cell.load(trip: _availableTrips[indexPath.row])
            return cell
        }
        
    }

}

