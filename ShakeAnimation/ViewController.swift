//
//  ViewController.swift
//  ShakeAnimation
//
//  Created by Daesub Kim on 2016. 12. 6..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceLabel: UILabel!
    
    @IBOutlet weak var diceNumberTextfield: UITextField!
    
    @IBOutlet weak var diceImageView: UIImageView!
    
    func toggleAnimation() {
        if diceImageView.isAnimating() {
            diceImageView.stopAnimating()
        } else {
            diceImageView.startAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        diceImageView.image = UIImage(named: "default_img")!
        diceImageView.animationImages = [
        UIImage(named: "default_img")!,
        UIImage(named: "default_img")!,
        UIImage(named: "default_img")!,
        UIImage(named: "default_img")!,
        UIImage(named: "default_img")!,
        UIImage(named: "default_img")!,
        UIImage(named: "default_img")!
        ]
        diceImageView.animationDuration = 5
        diceImageView.animationRepeatCount = 0
        //diceImageView.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // http://www.ioscreator.com/tutorials/detect-shake-gesture-ios8-swift
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    // UIEvent? must be used. It has been changed since Swift 2.0
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        diceImageView.startAnimating()
        diceLabel.text = "Shaking!"
    }
    
    // UIEvent? must be used. It has been changed since Swift 2.0
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            let range = (1, 6)
            let num = arc4random_uniform(UInt32(range.1 - range.0) + 1) + UInt32(range.0)
            self.diceNumberTextfield.text = String(num)
            let imageName = "dice\(num)"
            diceImageView.image = UIImage(named: imageName)!
            
            diceImageView.stopAnimating()
            diceLabel.text = "Re-shake your device to roll a dice"
        }
    }
}

