//
//  Register.swift
//  UserLogin
//
//  Created by Mitosis on 23/02/17.
//  Copyright © 2017 Mitosis. All rights reserved.
//

import UIKit
import CoreData


class Register: UIViewController, UITextFieldDelegate {
    @IBOutlet var regname: UITextField!

    @IBOutlet var regemail: UITextField!
    
    @IBOutlet var regpass: UITextField!
    
    @IBOutlet var cfnmpass: UITextField!
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet var dataView: UIView!
    @IBOutlet var tapRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        formatView()
           }
    
    func formatView()
    {
        tapRegister.layer.cornerRadius = 10
        tapRegister.clipsToBounds = true
        dataView.addSubview(tapRegister)
        dataView.layer.cornerRadius = 10
        dataView.clipsToBounds = true
        myView.addSubview(dataView)
        view.addSubview(myView)
        self.regname.delegate = self
        self.regemail.delegate = self
        self.regpass.delegate = self
        self.cfnmpass.delegate = self
 
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func assignbackground(){
        
        let background = UIImage(named: "login_bg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleToFill
        imageView.clipsToBounds = true
        imageView.image = background
        //imageView.alpha=0.5
        imageView.center = view.center
        myView.addSubview(imageView)
        myView.sendSubview(toBack: imageView)
        
    }
   

    func isValidEmail(_ testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }

    func validate(_ value: String) ->  Bool {
        
        let PASS_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$" //Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character
        let passTest = NSPredicate(format: "SELF MATCHES %@", PASS_REGEX)
        let result =  passTest.evaluate(with: value)
        return result
    }
    
    
    func  displayMyAlert(_ userMessage:String)
    {
        let myAlert=UIAlertController(title:"Alert",message: userMessage,preferredStyle: UIAlertControllerStyle.alert);
        let okAction=UIAlertAction(title:"ok",style:UIAlertActionStyle.default, handler:nil);
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
    }
    
    @IBAction func btnSubmit(_ sender: AnyObject) {
        let name = self.regname.text
        let emailid = regemail.text
        let pwd = regpass.text
        let cnfmpwd = cfnmpass.text
        
        if(name!.isEmpty || emailid!.isEmpty || pwd!.isEmpty || cnfmpwd!.isEmpty)
        {
            displayMyAlert("All Fields are required");
           
        }
            
            
        else if((pwd==cnfmpwd) && isValidEmail(emailid!) && validate(pwd!))
        {
            self.SaveUser()
            performSegue(withIdentifier: "btnSubmit", sender: sender)
        }
        else{
            displayMyAlert("Enter correct Email and Password");       
        }
    }
    
    func SaveUser(){
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
      let context = appDelegate.managedObjectContext
        
        let newuser =  NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newuser.setValue(regname.text, forKey: "name")
        newuser.setValue(regemail.text, forKey: "email")
        newuser.setValue(regpass.text, forKey: "password")
        
        do {
            try context.save()
            print("saved")
            print("Newuser: \(newuser)")
            
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    

}
