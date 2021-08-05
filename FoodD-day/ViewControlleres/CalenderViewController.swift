//
//  CalenderViewController.swift
//  FoodD-day
//
//  Created by Apple on 2021/08/04.
//

import UIKit

class CalenderViewController: UIViewController {
    
    
    @IBOutlet weak var bottomBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bottomBox.layer.borderColor = UIColor.gray.cgColor
        bottomBox.layer.borderWidth = 0.15
        bottomBox.layer.cornerRadius = 25
        bottomBox.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        bottomBox.layer.shadowColor = UIColor.black.cgColor
        bottomBox.layer.shadowOpacity = 0.15
        bottomBox.layer.shadowOffset = .zero
        bottomBox.layer.shadowRadius = 5
    }


}
