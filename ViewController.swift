//
//  ViewController.swift
//  Login Page Test
//
//  Created by Miles Tucker on 4/15/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     override func viewDidAppear(_ animated: Bool)
    {
        
        
            self.performSegue(withIdentifier: "loginView", sender: self);
        
        
    }
    
}

