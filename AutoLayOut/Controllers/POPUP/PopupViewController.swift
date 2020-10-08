//
//  PopupViewController.swift
//  AutoLayOut
//
//  Created by Pawan  on 08/10/2020.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var urlView: UIView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var whatsappButton: UIButton!
    @IBOutlet weak var messangerButton: UIButton!
    @IBOutlet weak var msgButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlView.layer.cornerRadius = 8
        copyButton.layer.cornerRadius = 12
        facebookButton.layer.cornerRadius = 35
        whatsappButton.layer.cornerRadius = 35
        messangerButton.layer.cornerRadius = 35
        msgButton.layer.cornerRadius       = 35
        
    }
}
