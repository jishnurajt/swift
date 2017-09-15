//
//  CollectionCell.swift
//  loginswift
//
//  Created by Appzoc on 18/07/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import UIKit
protocol sampleDelegate {
    func delete(index:Int)
}



class CollectionCell: UICollectionViewCell {
    @IBOutlet var btn: UIButton!
    @IBOutlet var img: UIImageView!
    @IBOutlet var lb: UILabel!
   // var delegate:sampleDelegate!
    
//    @IBAction func deleteaction(_ sender: Any) {
//        
//        delegate.delete(index: self.tag)
//        
//    }

   
    
}
