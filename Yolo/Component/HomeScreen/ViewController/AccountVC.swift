//
//  AccountVC.swift
//  Yolo
//
//  Created by Nitin Khurana on 22/03/20.
//  Copyright © 2020 Nitin Khurana. All rights reserved.
//

import UIKit

class AccountVC: UITableViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.parent?.navigationItem.title = "Account"
        image.layer.cornerRadius = 50

    }

}
