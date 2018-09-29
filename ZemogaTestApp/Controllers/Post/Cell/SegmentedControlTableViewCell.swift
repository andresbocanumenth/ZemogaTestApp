//
//  SegmentedControlTableViewCell.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit

class SegmentedControlTableViewCell: UITableViewCell {
    
    static let identifier = "SegmentedControlTableViewCell"
    var onSegmentedControlChange: ((Int) -> Void)?
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func valueChanged(_ sender: Any) {
        onSegmentedControlChange?(segmentedControl.selectedSegmentIndex)
    }
    
    
}
