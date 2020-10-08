//
//  LoginViewController.swift
//  AutoLayOut
//
//  Created by Pawan  on 06/10/2020.
//
import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    //MARK: - Outlets
    @IBOutlet weak var GoogleBtn: UIButton!
    @IBOutlet weak var FacebookBtn: UIButton!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var TextPassword: UITextField!
    
    
    
    //@IBOutlet weak var googleButton
    //@IBOutlet weak var googleLabel
    //@IBOutlet weak var emailTextField
    
    //MARK: - Variables
    //lower ->camelCase
    //class,struct,enum,protocols -> UpperCamelCase
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        TextField.delegate = self
       
    }
    
    
    //MARK:- Setup View  (Methods)
    func viewSetup() {
        
        TextField.BottomBorder()
        TextPassword.BottomBorder()
        
        LoginBtn.layer.cornerRadius = 20
        
        FacebookBtn.layer.backgroundColor = .none
        FacebookBtn.layer.borderWidth = 1.5
        FacebookBtn.layer.cornerRadius = 20
        FacebookBtn.layer.borderColor = UIColor.blue.cgColor
        
        GoogleBtn.layer.backgroundColor = .none
        GoogleBtn.layer.borderWidth = 1.5
        GoogleBtn.layer.cornerRadius = 20
        GoogleBtn.layer.borderColor = UIColor.red.cgColor
    }
    
    //
    
    
    
    func setButton() {
    
        let inputValid = checkInput()

        if inputValid {

            GoogleBtn.isEnabled = true
            print("Good hogya")

        } else {

            GoogleBtn.isEnabled = false
            print("Error")
            
        }
    }
    //
    func checkInput() -> Bool {

        let name1Value = TextField.text
        let name2Value = TextPassword.text
        
        if !name1Value!.isEmpty && !name2Value!.isEmpty {
            return true
        }
        return false
    }
    
  /*
   func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == TextField{
            if ((textField.text?.contains(" ")) != nil){
            print("done")
            }else{
                print("error")
            }
        }
        if textField == TextPassword{
            if ((textField.text?.contains(" ")) != nil){
            print("done")
            }else{
                print("error")
            }
        }
    }
 */
    @IBAction func googleButtonTapped(_ sender: UIButton) {
    
        if let text = TextField.text {
            if text.hasPrefix(" ") && containsOnlyLetters(input: text) {
                print("Valid TF")
            } else if text.hasPrefix(" ") && !containsOnlyLetters(input: text) {
                print("Not valid TF")
            } 
        }
    }
    func containsOnlyLetters(input: String) -> Bool {
       for chr in input {
          if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
             return false
          }
       }
       return true
    }

}

