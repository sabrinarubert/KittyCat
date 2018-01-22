//
//  ViewController.swift
//  KittyCat
//
//  Created by Sabrina Rubert on 21.01.18.
//  Copyright © 2018 Sabrina Rubert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var eyes_sleepy: UIImageView!
    @IBOutlet weak var eyes_awake: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
        startHeartAnimation()
        startBlinkingEyes ()
        
    }
    
    func startHeartAnimation () {
    
        
    
        UIView.animate(withDuration: 0.8, delay: 0.5, options: [UIViewAnimationOptions.autoreverse,UIViewAnimationOptions.repeat], animations: {
            
            self.heart.alpha = 0
            
        }) { (completed:Bool) in
            
            print("animation ist fertig");
            
        }
        
    }
    
    
    func startBlinkingEyes () {
        
        self.eyes_awake.alpha = 1
        self.eyes_sleepy.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: [UIViewAnimationOptions.autoreverse,UIViewAnimationOptions.repeat], animations: {
            
            self.eyes_awake.alpha = 0
            self.eyes_sleepy.alpha = 1
                
            
             }) { (completed:Bool) in
            
        
        }
        
    }
    
    
    
    func changeColor() {

        let colors : Array<UIColor> = [UIColor(red:0.94, green:0.76, blue:0.76, alpha:1.00), UIColor(red:0.76, green:0.91, blue:0.96, alpha:1.00),UIColor(red:0.85, green:0.94, blue:0.89, alpha:1.00), UIColor(red:0.98, green:0.94, blue:0.88, alpha:1.00)]
        
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        
        self.view.backgroundColor = colors[randomIndex]
        
        if (randomIndex == 0 ) {
            // nur wenn es rosa ist
            self.heart.isHidden = false
        } else {
            self.heart.isHidden = true
        }
        
        
    }

    @IBAction func onChangeColor(_ sender: Any) {
        changeColor()
        
    }
}

