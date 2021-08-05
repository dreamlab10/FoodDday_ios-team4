//
//  ViewController.swift
//  FoodD-day
//
//  Created by Apple on 2021/07/29.
//


import UIKit

class MainViewController: UIViewController {
   
    @IBOutlet weak var GreenTop: UIView!
    @IBOutlet weak var bottomBar: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBAction func pageChanged(_ sender: UIPageControl) {
    }
    
    @IBOutlet weak var parchmentView: UIView!
    
    @IBOutlet weak var all: UIView!
    @IBOutlet weak var orange: UIView!
    @IBOutlet weak var chicken: UIView!
    @IBOutlet weak var crab: UIView!
    @IBOutlet weak var egg: UIView!
    @IBOutlet weak var seasoning: UIView!
    @IBOutlet weak var snack: UIView!
    @IBOutlet weak var white: UIImageView!
    
    
    
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
        all.layer.shadowOffset = .zero
        all.layer.shadowOpacity = 0.15
        all.layer.shadowRadius = 7
        
        //orange
        orange.layer.cornerRadius = 25
        orange.layer.borderWidth = 0.1
        orange.layer.borderColor = UIColor.gray.cgColor
        orange.layer.masksToBounds = false
        orange.layer.shadowColor = UIColor.black.cgColor
        orange.layer.shadowOffset = .zero
        orange.layer.shadowOpacity = 0.15
        orange.layer.shadowRadius = 5
        
        //chicken
        chicken.layer.cornerRadius = 25
        chicken.layer.borderWidth = 0.1
        chicken.layer.borderColor = UIColor.gray.cgColor
        chicken.layer.masksToBounds = false
        chicken.layer.shadowColor = UIColor.black.cgColor
        chicken.layer.shadowOffset = .zero
        chicken.layer.shadowOpacity = 0.15
        chicken.layer.shadowRadius = 5
        
        // crab
        crab.layer.cornerRadius = 25
        crab.layer.borderWidth = 0.1
        crab.layer.borderColor = UIColor.gray.cgColor
        crab.layer.masksToBounds = false
        crab.layer.shadowColor = UIColor.black.cgColor
        crab.layer.shadowOffset = .zero
        crab.layer.shadowOpacity = 0.15
        crab.layer.shadowRadius = 5
        
        //egg
        egg.layer.cornerRadius = 25
        egg.layer.borderWidth = 0.1
        egg.layer.borderColor = UIColor.gray.cgColor
        egg.layer.masksToBounds = false
        egg.layer.shadowColor = UIColor.black.cgColor
        egg.layer.shadowOffset = .zero
        egg.layer.shadowOpacity = 0.15
        egg.layer.shadowRadius = 5
        
        // seasoning
        seasoning.layer.cornerRadius = 25
        seasoning.layer.borderWidth = 0.1
        seasoning.layer.borderColor = UIColor.gray.cgColor
        seasoning.layer.masksToBounds = false
        seasoning.layer.shadowColor = UIColor.black.cgColor
        seasoning.layer.shadowOffset = .zero
        seasoning.layer.shadowOpacity = 0.15
        seasoning.layer.shadowRadius = 5
        
        // snack
        snack.layer.cornerRadius = 25
        snack.layer.borderWidth = 0.1
        snack.layer.borderColor = UIColor.gray.cgColor
        snack.layer.masksToBounds = false
        snack.layer.shadowColor = UIColor.black.cgColor
        snack.layer.shadowOffset = .zero
        snack.layer.shadowOpacity = 0.15
        snack.layer.shadowRadius = 5
        
        // bottomBar 테두리색
        bottomBar.layer.borderColor = UIColor.gray.cgColor
        bottomBar.layer.borderWidth = 0.15
        bottomBar.layer.cornerRadius = 25
        bottomBar.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        bottomBar.layer.shadowColor = UIColor.black.cgColor
        bottomBar.layer.shadowOpacity = 0.15
        bottomBar.layer.shadowOffset = .zero
        bottomBar.layer.shadowRadius = 5
        self.view.bringSubviewToFront(self.bottomBar)
        self.view.bringSubviewToFront(self.white)
    }
    
    // 메인 화면의 테이블뷰 갱신 
    func reloadTableViewData() {
        print("reload")
        // Todo 하위 뷰에서 테이블뷰 찾아서 tableView.reloadData()
        // parchmentView

        
    }
    var foodContainerVC: FoodSpeciesViewController?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue start")
        if segue.identifier == "food" {
            if let vc = segue.destination as? FoodSpeciesViewController {
                self.foodContainerVC = vc
                print("get food")
            }
        }
    }
}

