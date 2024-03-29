//
//  SwiftViewController.swift
//  SendOTPFramework
//
//  Created by Hussain on 12/07/16.
//  Copyright © 2016 Walkover. All rights reserved.
//

import UIKit
import SendOTPFramework
class SwiftViewController: UIViewController,SendOTPAuthenticationViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func openSendOtp(_ sender: AnyObject) {
        let frameworkBundle = Bundle(identifier: "com.walkover.SendOTPFramework")
        let authViewControler :AuthenticationViewController = AuthenticationViewController.init(nibName: "AuthenticationViewController", bundle: frameworkBundle)
        authViewControler.delegate = self
        authViewControler.navBarColor = UIColor.blue
        
        // set navbar title color
        authViewControler.navBarTitleColor = UIColor.white
        
        //Set your auth key* here
        authViewControler.tokenAuth = "xyz"
        //Set your templete id*
        authViewControler.templateId = "abc"
        
        // set company logo
        authViewControler.companyImage = UIImage.init(named: "defaultLogo.png")
        
        //****Style Mandatory*****
        authViewControler.modalPresentationStyle = .fullScreen;

        self.present(authViewControler, animated: true, completion: nil)
    }
    
    func authenticationisSuccessful(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Success")
    }
    
    func authenticationisFailed(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Failure")
    }
    
    func canceledAuthentication() {
        print("Failure")
        
    }
    
}
