//
//  FSAlbumViewCell.swift
//  Fusuma
//
//  Created by Yuta Akizuki on 2015/11/14.
//  Copyright © 2015年 ytakzk. All rights reserved.
//

import UIKit
import Photos

final class FSAlbumViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var checkmarkImageView: UIImageView! {
        didSet {
           // checkmarkImageView.isHidden = true
        }
    }
    @IBOutlet weak var numButton: UIButton!{
        didSet{
            numButton.isHidden = true
        }
    }
    
    var selectedLayer = CALayer()

    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var num = 0 {
        didSet{
            if num > 0 {
                 numButton.isHidden = false
                 numButton.setTitle("\(num)", for: .normal)
            }else{
                 numButton.isHidden = true
            }
           
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        isSelected = false
        selectedLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5).cgColor
        
        numButton.layer.cornerRadius = numButton.bounds.height/2
        numButton.layer.masksToBounds = true
        numButton.isUserInteractionEnabled = false
    }

    
    
    override var isSelected : Bool {
       
        
        didSet {
             print(#function + "\(isSelected)")
            if selectedLayer.superlayer == self.layer {
                selectedLayer.removeFromSuperlayer()
               // checkmarkImageView.isHidden = true
                numButton.isHidden = true
            }

            if isSelected {
                selectedLayer.frame = self.bounds
                layer.addSublayer(selectedLayer)
                //checkmarkImageView.isHidden = false
                self.bringSubviewToFront(numButton)
                numButton.isHidden = false
              
            }
            
        }
        
    }
}
