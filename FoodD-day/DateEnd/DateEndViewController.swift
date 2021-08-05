//
//  ViewController.swift
//  FoodD-day
//
//  Created by Apple on 2021/07/29.
//
//

import UIKit

class DateEndViewController: UIViewController {
  
   
    @IBOutlet weak var GreenTop: UIView!

    @IBOutlet weak var bottomBox: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
    }
    

    

    
    
    
    @IBOutlet weak var all: UIView!
    @IBOutlet weak var orange: UIView!
    @IBOutlet weak var chicken: UIView!
    @IBOutlet weak var crab: UIView!
    @IBOutlet weak var egg: UIView!
    @IBOutlet weak var seasoning: UIView!
    @IBOutlet weak var snack: UIView!



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // top page round
        let path = UIBezierPath(roundedRect: GreenTop.bounds,
                                byRoundingCorners: [.bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: 30, height: 30))

        let maskLayer = CAShapeLayer()
        maskLayer.frame = GreenTop.bounds
        maskLayer.path = path.cgPath

        GreenTop.layer.mask = maskLayer


        // all
        all.layer.cornerRadius = 25
        all.layer.borderWidth = 0.1
        all.layer.borderColor = UIColor.gray.cgColor
        all.layer.masksToBounds = false
        all.layer.shadowColor = UIColor.black.cgColor
        all.layer.shadowOffset = CGSize(width: 4, height: 4)
        all.layer.shadowOpacity = 0.2
        all.layer.shadowRadius = 5

        //orange
        orange.layer.cornerRadius = 25
        orange.layer.borderWidth = 0.1
        orange.layer.borderColor = UIColor.gray.cgColor
        orange.layer.masksToBounds = false
        orange.layer.shadowColor = UIColor.black.cgColor
        orange.layer.shadowOffset = CGSize(width: 4, height: 4)
        orange.layer.shadowOpacity = 0.2
        orange.layer.shadowRadius = 5

        //chicken
        chicken.layer.cornerRadius = 25
        chicken.layer.borderWidth = 0.1
        chicken.layer.borderColor = UIColor.gray.cgColor
        chicken.layer.masksToBounds = false
        chicken.layer.shadowColor = UIColor.black.cgColor
        chicken.layer.shadowOffset = CGSize(width: 4, height: 4)
        chicken.layer.shadowOpacity = 0.2
        chicken.layer.shadowRadius = 5

        // crab
        crab.layer.cornerRadius = 25
        crab.layer.borderWidth = 0.1
        crab.layer.borderColor = UIColor.gray.cgColor
        crab.layer.masksToBounds = false
        crab.layer.shadowColor = UIColor.black.cgColor
        crab.layer.shadowOffset = CGSize(width: 4, height: 4)
        crab.layer.shadowOpacity = 0.2
        crab.layer.shadowRadius = 5

        //egg
        egg.layer.cornerRadius = 25
        egg.layer.borderWidth = 0.1
        egg.layer.borderColor = UIColor.gray.cgColor
        egg.layer.masksToBounds = false
        egg.layer.shadowColor = UIColor.black.cgColor
        egg.layer.shadowOffset = CGSize(width: 4, height: 4)
        egg.layer.shadowOpacity = 0.2
        egg.layer.shadowRadius = 5

        // seasoning
        seasoning.layer.cornerRadius = 25
        seasoning.layer.borderWidth = 0.1
        seasoning.layer.borderColor = UIColor.gray.cgColor
        seasoning.layer.masksToBounds = false
        seasoning.layer.shadowColor = UIColor.black.cgColor
        seasoning.layer.shadowOffset = CGSize(width: 4, height: 4)
        seasoning.layer.shadowOpacity = 0.2
        seasoning.layer.shadowRadius = 5

        // snack
        snack.layer.cornerRadius = 25
        snack.layer.borderWidth = 0.1
        snack.layer.borderColor = UIColor.gray.cgColor
        snack.layer.masksToBounds = false
        snack.layer.shadowColor = UIColor.black.cgColor
        snack.layer.shadowOffset = CGSize(width: 4, height: 4)
        snack.layer.shadowOpacity = 0.2
        snack.layer.shadowRadius = 5

        // bottomBar 테두리색
        bottomBox.layer.borderColor = UIColor.gray.cgColor
        bottomBox.layer.borderWidth = 0.15
        bottomBox.layer.cornerRadius = 25
        bottomBox.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)

        //bottombar round
        /*let path2 = UIBezierPath(roundedRect: bottomBar.bounds,
                                 byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 30, height: 30))

        let maskLayer2 = CAShapeLayer()
        maskLayer2.frame = bottomBar.bounds
        maskLayer2.path = path2.cgPath

        bottomBar.layer.mask = maskLayer2*/

        
        
    
    }
    
}

