//
//  ViewController.swift
//  FNVDemoiOS
//
//  Created by Daisuke T on 2019/02/04.
//  Copyright © 2019 FNVDemoiOS. All rights reserved.
//

import UIKit

import FNV

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		print(FNV.fnv1a_32("Hello World!"))
	}


}

