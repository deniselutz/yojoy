//
//  SubSequencesViewController.swift
//  yojoy
//
//  Created by Denise Lutz on 25.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit

class SubSequencesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var selectedSequenceArray = [Details]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // no parting lines below the table
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSequenceArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath) as! SubSequenceCell
        let sequence = selectedSequenceArray[indexPath.row]
        
        cell.subTopicLabel.text = sequence.title
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
