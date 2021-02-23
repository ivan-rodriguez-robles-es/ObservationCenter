//
//  ViewController.swift
//  ObservationCenter
//
//  Created by ivk on 15/10/2020.
//  Copyright © 2020 irr. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vcB = self.tabBarController?.viewControllers?[1]
        
        let vcC = self.tabBarController?.viewControllers?[2]
        vcB?.viewDidLoad()
        vcC?.viewDidLoad()

    }

    @IBAction func sendPinkNotification(_ sender: Any) {
        
        observationCenter.instance.post (message: "pink", suscriptionId: "Change Color")
        
        view.backgroundColor = .systemPink

    }
    
    @IBAction func sendBlueNotification (_ sender: Any){
        
        observationCenter.instance.post(message: "blue", suscriptionId: "Change Color")
        view.backgroundColor = .systemBlue
    }

}

