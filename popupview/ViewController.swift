//
//  ViewController.swift
//  popupview
//
//  Created by İlker isa Mercan on 8.09.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        

    }

    @IBAction func button1(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            let pop = Popup()
            self.view.addSubview(pop)
            
        }

    }
    
}

