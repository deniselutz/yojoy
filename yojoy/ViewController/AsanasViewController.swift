//
//  AsanasViewController.swift
//  yojoy
//
//  Created by Denise Lutz on 04.10.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit

class AsanasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var asanaCollectionView: UICollectionView!
    
    let asanasImagesArray = ["yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini","yogini"]
    
        let asanasNamesArray = ["Berg","Baum","Fisch","Drehsitz","Pfau","Kobra","Schulterstand","Taube", "Hund","Baum","Fisch","Vorwärtsbeuge","Lotussitz","Katze","Kuh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // defines width based on a third width of the screen minus 3 pxl, so there is a little space between the pictures
        let imageSize = UIScreen.main.bounds.width/3 - 3
        
        // override current layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: imageSize, height: imageSize)
        
        // spacing between the images
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        asanaCollectionView.collectionViewLayout = layout
    }
    
    
    // Number of Views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asanasImagesArray.count
    }
    
    
    // Populate Views
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AsanaCollectionViewCell
        
        cell.asanaImageView.image = UIImage(named: asanasImagesArray[indexPath.row] + ".png")
        cell.asanaNameLabel.text = asanasNamesArray[indexPath.row]
        
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
