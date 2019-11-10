//
//  SecurityController.swift
//  News_Feed
//
//  Created by clines329 on 11/10/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit

class SecurityController: UIViewController {

 
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
      var error = ""
    override func viewDidLoad() {
        super.viewDidLoad()
self.errorLabel.text! = error

    }
    

    
    @IBAction func OK(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
