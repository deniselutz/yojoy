//
//  SubSequenceCell.swift
//  yojoy
//
//  Created by Denise Lutz on 25.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit

protocol ButtonPressedDelegate {
    func buttonPressed(_ tag: Int)
}

class SubSequenceCell: UITableViewCell {
    
    var cellDelegate: ButtonPressedDelegate?

    @IBOutlet weak var subTopicLabel: UILabel!
    @IBOutlet weak var infoButtonOutlet: UIButton!
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        cellDelegate?.buttonPressed(self.tag)
    }
    
    
}
