//
//  ViewController.swift
//  Activ5Extension
//
//  Created by Juan Dominguez on 10/25/19.
//  Copyright © 2019 VBC. All rights reserved.
//

import UIKit
import CoreBluetooth
import Activ5Device

class ViewController: UIViewController, A5DeviceDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        A5DeviceManager.delegate = self
    }
    
    
    // required by A5DeviceDelegate
    func searchCompleted() {
        
    }
    
    func deviceFound(device: A5Device) {
        
    }
    
    func deviceConnected(device: A5Device) {
    }
    
    func deviceDisconnected(device: A5Device) {
    }
    
    func didFailToConnect(device: A5Device, error: Error?) {
    }


}

