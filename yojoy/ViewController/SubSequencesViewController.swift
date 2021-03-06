//
//  SubSequencesViewController.swift
//  yojoy
//
//  Created by Denise Lutz on 25.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit

// the controller declares that it implements the delegation protocol (4)
class SubSequencesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ButtonPressedDelegate {
    
    // the controller implements the protocol and its function (6)
    func buttonPressed(_ tag: Int) {
        
        let buttonActionText = selectedSequenceArray[tag].title
        let buttonActionDescription = selectedSequenceArray[tag].description
        
        showAlert(title: buttonActionText, description: buttonActionDescription)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedSequenceArray = [Details]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background image
        let backgroundImage = UIImage(named: "yogini.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFit
        
        // no parting lines below the table
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSequenceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath) as! SubSequenceCell
        let sequence = selectedSequenceArray[indexPath.row]
        
        // the controller sets the delegate of the cell to itself using the delegate Property in #2 (5)
        cell.cellDelegate = self
        // use tag to identify the infoButtons
        cell.tag = indexPath.row
        
        cell.subTopicLabel.text = sequence.title
        cell.backgroundColor = UIColor(white: 1, alpha: 0.85)
        
        return cell
    }
    
    // MARK: - Functions
    
    func showAlert(title text: String, description subtext: String) {
        
            let alertController = UIAlertController(title: text, message:
                subtext, preferredStyle: UIAlertControllerStyle.alert)
        
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            alertController.view.tintColor = #colorLiteral(red: 0.47081393, green: 0.4458181858, blue: 0.5415937304, alpha: 1)
        
            self.present(alertController, animated: true, completion: nil)
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
