//
//  ViewController.swift
//  CoffeeDock-Swift
//
//  Created by Damien Glancy on 17/03/2015.
//  Copyright (c) 2015 Clinch, Ltd. All rights reserved.
//

import UIKit
import ClinchKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
    
  @IBAction func applicationFormBtnPressed(sender: AnyObject) {
    ClinchKit.showApplicationForm(job: nil)
  }
  
}