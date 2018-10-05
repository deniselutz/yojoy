//
//  SubSequencesViewController.swift
//  yojoy
//
//  Created by Denise Lutz on 25.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit

class SubSequencesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ButtonPressedDelegate {
    
    func buttonPressed(_ tag: Int) {
        print("button was pressed with tag: \(tag)")
        switch tag {
        case 0:
            showAlert(with: "first cell")
        case 1:
            showAlert(with: "second cell")
        default: break
        }
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
        
        switch indexPath.row {
        case 0, 1:
            cell.cellDelegate = self
            cell.tag = indexPath.row
        default: break
            
        }
        
        
        cell.subTopicLabel.text = sequence.title
        cell.backgroundColor = UIColor(white: 1, alpha: 0.85)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
    
    // MARK: - Functions
    
    func showAlert(with text: String) {
        
            let alertController = UIAlertController(title: "UI Alert", message:
                text, preferredStyle: UIAlertControllerStyle.alert)
        
             alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
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
