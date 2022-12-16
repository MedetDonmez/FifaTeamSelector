//
//  ViewController.swift
//  selector
//
//  Created by fmss on 25.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var con1: NSLayoutConstraint!
    @IBOutlet weak var con2: NSLayoutConstraint!
    @IBOutlet weak var con3: NSLayoutConstraint!
    @IBOutlet weak var con4: NSLayoutConstraint!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    lazy var list = [con1,con2,con3,con4]
    
    override func viewDidLoad() {
        image1.layer.cornerRadius = 8
        image2.layer.cornerRadius = 8
        image3.layer.cornerRadius = 8
        image4.layer.cornerRadius = 8
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        list.shuffle()

        UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   usingSpringWithDamping: 0.8,
                                   initialSpringVelocity: 0,
                                   options: .curveEaseInOut) {
            self.list.shuffle()
            
            self.list[0]!.constant = 10
            self.list[1]!.constant = 10
            self.list[2]!.constant = 230
            self.list[3]!.constant = 230
            
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   usingSpringWithDamping: 0.8,
                                   initialSpringVelocity: 0,
                                   options: .curveEaseInOut) {
            self.list.shuffle()
            
            self.list[0]!.constant = 120
            self.list[1]!.constant = 120
            self.list[2]!.constant = 120
            self.list[3]!.constant = 120
            
            self.view.layoutIfNeeded()
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SpinViewController") as! SpinViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
}

