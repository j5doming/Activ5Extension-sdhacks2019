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
import ActivSync

class LoginViewController: UIViewController, A5DeviceDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    //var user: ActivUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        A5DeviceManager.delegate = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ActivSync.auth.isLoggedIn {
            print("A user is already logged in")
            goToModifiedStats()
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        if loginButton.titleLabel?.text == "Finish" {
            signUpUser()
        } else {
            loginUser()
        }
    }
    @IBAction func onSignup(_ sender: Any) {
        guard let firstnameField = firstNameTextField, let lastnameField = lastNameTextField else { return }
        firstnameField.isHidden = false
        lastnameField.isHidden = false
        loginButton.titleLabel?.text = "Done"
    }
    
    func loginUser() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let credentials = UserCredentials(email: email, password: password)
        ActivSync.auth.login(with: .activbody, credentials: credentials) { (_, error) in
            if error != nil {
                print("Error loggin in")
                return
            }
            self.goToModifiedStats()
        }
    }
    
    func signUpUser() {
        guard let firstname = firstNameTextField.text, let lastname = lastNameTextField.text,
            let email = emailTextField.text, let password = passwordTextField.text else { return }
            
        let user = NewActivUser(email: email, password: password, fullName: "\(firstname) \(lastname)")
        
        ActivSync.auth.register(newUser: user) { (user, error) in
            if error != nil {
                print("error signing up")
                return
            }
            self.loginUser()
        }
    }
    
    func goToModifiedStats() {
        let storyboard = UIStoryboard(name: "ModifiedStats", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ModifiedStats")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
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

