//
//  TableViewCell.swift
//  UserLogin
//
//  Created by Mitosis on 20/02/17.
//  Copyright © 2017 Mitosis. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var myImage: UIImageView!
    
    
    var slide: Int = 0
    let animationDuration: TimeInterval = 1.0
    let switchingInterval: TimeInterval = 15
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        animateImageView()
        
        
        
        myImage.isUserInteractionEnabled = true
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_gesture:)))
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        myImage.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped(_gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        myImage.addGestureRecognizer(swipeLeft)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var slides = [UIImage(named:"banner1")!,UIImage(named:"banner2")!,UIImage(named:"banner3")!, UIImage(named:"banner4")!,UIImage(named:"banner5")!]
    
    func animateImageView() {
        if(slide  < 4){
            CATransaction.begin()
            
            CATransaction.setAnimationDuration(animationDuration)
            CATransaction.setCompletionBlock {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.switchingInterval)
                {
                    
                    self.animateImageView()
                }
            }
            
            let transition = CATransition()
            // transition.type = kCATransitionFade
            
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            
            myImage.layer.add(transition, forKey: kCATransition)
            myImage.image = slides[slide]
            
            CATransaction.commit()
            print("\(slide)")
            slide+=1
            
        }
        else if(slide > 4 || slide == 4 ){
            slide = 0
            CATransaction.begin()
            
            CATransaction.setAnimationDuration(animationDuration)
            CATransaction.setCompletionBlock {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + self.switchingInterval)
                {
                    
                    self.animateImageView()
                }
            }
            
            let transition = CATransition()
            // transition.type = kCATransitionFade
            
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            
            myImage.layer.add(transition, forKey: kCATransition)
            myImage.image = slides[slide]
            
            CATransaction.commit()
            print("\(slide)")
            slide+=1
            
        }
        
    }
    func swiped(_gesture: UIGestureRecognizer) {
        
        if let swipeGesture = _gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                if (self.slide == 0) {
                    
                    self.slide = 4
                    CATransaction.begin()
                    CATransaction.setAnimationDuration(animationDuration)
                    let transition = CATransition()
                    // transition.type = kCATransitionFade
                    
                    transition.type = kCATransitionPush
                    transition.subtype = kCATransitionFromLeft
                    
                    myImage.layer.add(transition, forKey: kCATransition)
                    myImage.image = slides[slide]
                    CATransaction.commit()
                    
                    print("\(slide)")
                }
                else if(slide > 4)
                {
                    slide = 4
                    self.slide-=1
                    CATransaction.begin()
                    CATransaction.setAnimationDuration(animationDuration)
                    let transition = CATransition()
                    // transition.type = kCATransitionFade
                    
                    transition.type = kCATransitionPush
                    transition.subtype = kCATransitionFromLeft
                    
                    myImage.layer.add(transition, forKey: kCATransition)
                    myImage.image = slides[slide]
                    CATransaction.commit()
                    print("\(slide)")
                    
                }
                    
                else
                {
                    self.slide-=1
                    CATransaction.begin()
                    CATransaction.setAnimationDuration(animationDuration)
                    let transition = CATransition()
                    // transition.type = kCATransitionFade
                    
                    transition.type = kCATransitionPush
                    transition.subtype = kCATransitionFromLeft
                    
                    myImage.layer.add(transition, forKey: kCATransition)
                    myImage.image = slides[slide]
                    CATransaction.commit()
                    print("\(slide)")
                }
                
                
            case UISwipeGestureRecognizerDirection.left:
                
                if (self.slide == 4) {
                    
                    self.slide = 0
                    CATransaction.begin()
                    CATransaction.setAnimationDuration(animationDuration)
                    let transition = CATransition()
                    // transition.type = kCATransitionFade
                    
                    transition.type = kCATransitionPush
                    transition.subtype = kCATransitionFromRight
                    
                    myImage.layer.add(transition, forKey: kCATransition)
                    myImage.image = slides[slide]
                    CATransaction.commit()
                    print("\(slide)")
                }
                else if(self.slide < 4){
                    
                    self.slide+=1
                    CATransaction.begin()
                    CATransaction.setAnimationDuration(animationDuration)
                    let transition = CATransition()
                    // transition.type = kCATransitionFade
                    
                    transition.type = kCATransitionPush
                    transition.subtype = kCATransitionFromRight
                    
                    myImage.layer.add(transition, forKey: kCATransition)
                    myImage.image = slides[slide]
                    CATransaction.commit()
                    print("\(slide)")
                    
                }
                
            default:
                break //stops the code/codes nothing.
                
            }
        }
    }

}
