//
//  ViewController.swift
//  GestureTutorial
//
//  Created by Jason Valencius Wijaya on 11/07/19.
//  Copyright © 2019 Jason Valencius Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlet Rectangle View
    @IBOutlet weak var rectangleView: UIView!
    
    //Outlet Rectangle View
    @IBOutlet weak var rectanglePanView: UIView!
    
    //Variabel Center Point of View
    var initialCenter = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Function Tap
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        rectangleView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    //Function Pan Gesture
    @IBAction func pan(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        guard gestureRecognizer.view != nil else {return}
        
        let piece = gestureRecognizer.view!
        
        let translation = gestureRecognizer.translation(in: piece.superview)
        
        if gestureRecognizer.state == .began{
            self.initialCenter = piece.center
        }
        
        if gestureRecognizer.state != .cancelled{
            let newCenter = CGPoint(x: initialCenter.x+translation.x, y: initialCenter.y+translation.y)
            piece.center = newCenter
        }
        else{
            piece.center = initialCenter
        }
        
    }
    
}

