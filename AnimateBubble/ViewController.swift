//
//  ViewController.swift
//  AnimateBubble
//
//  Created by Kaleb Wijaya on 14/05/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bubble: UIView!
    var flag:Bool = true
    
    
    
    func move(view: UIView) {
        let x = Int.random(in: 80 ... 150)
        let y = Int.random(in: 100 ... 350)
        if(flag){
            view.center.x += CGFloat(x)
            view.center.y += CGFloat(y)
            flag = false
        }else{
            view.center.x -= CGFloat(x)
            view.center.y -= CGFloat(y)
            flag = true
        }
    }
    
    func changeViewColor(view: UIView){
        view.backgroundColor = UIColor(displayP3Red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue:
            CGFloat(Float.random(in: 0...1)), alpha: 1)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bubble.layer.cornerRadius = bubble.frame.width/2

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.bubble.addGestureRecognizer(gesture)
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.5, options: .curveLinear, animations: {
            self.move(view: self.bubble)
            self.changeViewColor(view: self.bubble)
        })
    }

}

