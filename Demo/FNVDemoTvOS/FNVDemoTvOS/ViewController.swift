//
//  ViewController.swift
//  FNVDemoTvOS
//
//  Created by Daisuke T on 2019/02/11.
//  Copyright © 2019 FNVDemoTvOS. All rights reserved.
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

