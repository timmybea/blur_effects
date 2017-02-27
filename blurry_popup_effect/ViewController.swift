//
//  ViewController.swift
//  blurry_popup_effect
//
//  Created by Tim Beals on 2017-02-27.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "guitar")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let blurEffectView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        view.effect = blurEffect
        return view
    }()
    
//    let vibrancyEffectView: UIVisualEffectView = {
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
//        let view = UIVisualEffectView(effect: vibrancyEffect)
//        return view
//    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Change Effect", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTouched), for: .touchUpInside)
        button.backgroundColor = UIColor.darkGray
        button.tintColor = UIColor.white
        return button
    }()
 
    var state = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Blurry Pop-up"
    
        imageView.frame = self.view.frame
        view.addSubview(imageView)
        
        
        blurEffectView.frame = self.view.frame
        view.addSubview(blurEffectView)
        blurEffectView.isHidden = true
        
        view.addSubview(button)
        button.frame = CGRect(x: imageView.center.x - 80, y: imageView.frame.height * 0.66, width: 160, height: 30)
        
        //note that effect views contain multiple views within them so subviews need to be added to the specific content view.
        //blurEffectView.contentView.addSubview(segmentedControl)
        
    }

    func handleButtonTouched() {
        
        switch state {
        case 0:
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            blurEffectView.effect = blurEffect
            blurEffectView.isHidden = false
            button.setTitle("Dark", for: .normal)
            state = 1
        case 1:
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
            blurEffectView.effect = blurEffect
            button.setTitle("Regular", for: .normal)
            state = 2
        case 2:
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.prominent)
            blurEffectView.effect = blurEffect
            button.setTitle("Prominent", for: .normal)
            state = 3
        case 3:
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            blurEffectView.effect = blurEffect
            button.setTitle("Light", for: .normal)
            state = 4
        case 4:
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
            blurEffectView.effect = blurEffect
            button.setTitle("Extra light", for: .normal)
            state = 5
        case 5:
            blurEffectView.isHidden = true
            button.setTitle("Change Effect", for: .normal)
            state = 0
        default:
            print("something went wrong")
        }
        
        
        
    }
    

}

