//
//  ViewController.swift
//  ObservationCenter
//
//  Created by ivk on 15/10/2020.
//  Copyright © 2020 irr. All rights reserved.
//

import UIKit

class ViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let action = notificationAction
        
        observationCenter.instance.addObserver(id: 1, observerObj: self, suscriptionId: "Change Color", action: action)
        
        observationCenter.instance.addObserver(id: 2, observerObj: self, suscriptionId: "Change Color", action: action)
    }

    func notificationAction (message: Any){
        print ("notificationAction with message: \(message)")
        if (message as! String == "pink"){
            view.backgroundColor = .systemPink
        }else{ // Blue BackGround
            view.backgroundColor = .systemBlue
        }
    }
}

