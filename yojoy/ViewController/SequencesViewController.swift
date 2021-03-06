//
//  SequencesViewController.swift
//  yojoy
//
//  Created by Denise Lutz on 25.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SequencesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    
    var sequencesArray = [Sequence]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set a realtime reference to firebase database
        ref = Database.database().reference().child("sequences")
        loadSequences()
    }

    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sequencesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SequenceCell
        let sequence = sequencesArray[indexPath.row]
        
        cell.topicLabel.text = sequence.chapter
        cell.subTopicLabel.text = sequence.subChapter
        
        return cell
    }
    
    //load sequences
    private func loadSequences() {
        
        // observing the data changes
        ref?.child("chapter").observeSingleEvent(of: .value, with: { (snapshot) in
            // if the reference has some values
            if snapshot.childrenCount > 0 {
                
//                //clearing list
//                self.sequencesArray.removeAll()
                
                //for-loop; iterating through all the values
                for sequences in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let sequenceObject = sequences.value as? [String: AnyObject]
                    let sequenceChapter = sequenceObject?["chapter"]
                    let sequenceSubChapter = sequenceObject?["subChapter"]
                
                    //creating sequence object with model and fetched values
                    let sequence = Sequence(chapter: sequenceChapter as! String, subChapter: sequenceSubChapter as! String)
                    
                    //appending it to list
                    self.sequencesArray.append(sequence)
                    
                    //reloading the tableview
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSubSequence", sender: self)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            let destination = segue.destination as! SubSequencesViewController
            
            var childId = ""
            
            switch selectedRow {
            case 0:
                childId = "subChapter01"
            case 1:
                childId = "subChapter02"
            case 2:
                childId = "subChapter03"
            case 3:
                childId = "subChapter04"
            case 4:
                childId = "subChapter05"
            case 5:
                childId = "subChapter06"
            case 6:
                childId = "subChapter07"
            case 7:
                childId = "subChapter08"
            case 8:
                childId = "subChapter09"
            default:
                break
            }
            
            // observing the data changes
            ref?.child(childId).observeSingleEvent(of: .value, with: { (snapshot) in
                
                // if the reference has some values
                if snapshot.childrenCount > 0 {
                    
                    //for-loop; iterating through all the values
                    for sequences in snapshot.children.allObjects as! [DataSnapshot] {
                        //getting values
                        let sequenceObject = sequences.value as? [String: AnyObject]
                        let sequenceTitle = sequenceObject?["title"]
                        let sequenceDescription = sequenceObject?["description"]
                        
                         //creating sequence object with model and fetched values
                        let detail = Details(title: sequenceTitle as! String, description: sequenceDescription as! String)
                        
                         //appending it to list
                        destination.selectedSequenceArray.append(detail)
                        
                        //reloading the destination.tableview
                        destination.tableView.reloadData()
                    }
                }
            })
        }
    }
}

