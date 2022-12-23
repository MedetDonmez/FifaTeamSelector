//
//  ViewController.swift
//  selector
//
//  Created by fmss on 25.11.2022.
//

import UIKit

class JoystickViewController: UIViewController {
    
    @IBOutlet weak var heightCon1: NSLayoutConstraint!
    @IBOutlet weak var heightCon2: NSLayoutConstraint!
    @IBOutlet weak var heightCon3: NSLayoutConstraint!
    @IBOutlet weak var heightCon4: NSLayoutConstraint!
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
        heightCon1.constant = UIScreen.main.bounds.height/8
        heightCon2.constant = UIScreen.main.bounds.height/8
        heightCon3.constant = UIScreen.main.bounds.height/8
        heightCon4.constant = UIScreen.main.bounds.height/8
        con1.constant = (UIScreen.main.bounds.width - 174)/2
        con2.constant = (UIScreen.main.bounds.width - 174)/2
        con3.constant = (UIScreen.main.bounds.width - 174)/2
        con4.constant = (UIScreen.main.bounds.width - 174)/2
        
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
            self.list[2]!.constant = UIScreen.main.bounds.width - 184
            self.list[3]!.constant = UIScreen.main.bounds.width - 184
            
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
            
            self.list[0]!.constant = (UIScreen.main.bounds.width - 174)/2
            self.list[1]!.constant = (UIScreen.main.bounds.width - 174)/2
            self.list[2]!.constant = (UIScreen.main.bounds.width - 174)/2
            self.list[3]!.constant = (UIScreen.main.bounds.width - 174)/2
            
            self.view.layoutIfNeeded()
//
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
//
//            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
}

