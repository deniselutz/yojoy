//
//  SubSequenceCell.swift
//  yojoy
//
//  Created by Denise Lutz on 25.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit

// declaration of a delegation protocol; what the cell wants the controller do for it (1)
protocol ButtonPressedDelegate {
    func buttonPressed(_ tag: Int)
}

class SubSequenceCell: UITableViewCell {
    
    // instantiate a delegate property of type delegation property (2)
    var cellDelegate: ButtonPressedDelegate?

    @IBOutlet weak var subTopicLabel: UILabel!
    @IBOutlet weak var infoButtonOutlet: UIButton!
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        // use of the delegate property (2) to get the number of selected Rows (self.tag) (3)
        cellDelegate?.buttonPressed(self.tag)
    }
}
