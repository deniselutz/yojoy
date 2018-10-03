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
    
    @IBAction func infoButton(_ sender: UIButton) {
    }
    
    var selectedSequenceArray = [Details]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        cell.subTopicLabel.text = sequence.title
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
    
    // MARK: - Functions
    
    @IBAction func showAlert(_ sender: Any) {
        
            let alertController = UIAlertController(title: "UI Alert", message:
                "Hello, world!", preferredStyle: UIAlertControllerStyle.alert)
        
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
