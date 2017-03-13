//
//  TableCell.swift
//  UserLogin
//
//  Created by Mitosis on 20/02/17.
//  Copyright © 2017 Mitosis. All rights reserved.
//

import UIKit


class TableCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    
    
    
    var picture = [UIImage(named:"pic1"),UIImage(named: "pic2"),UIImage(named:"patient_icon"),UIImage(named:"automobiles")]
    
    var names = ["Picture1","Picture2","Picture3","Picture4"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
           
}
extension TableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picture.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! myCell

        
        cell.collectionImage.image = picture[(indexPath as NSIndexPath).row]
        
        
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.row)!")
    
    }
}
