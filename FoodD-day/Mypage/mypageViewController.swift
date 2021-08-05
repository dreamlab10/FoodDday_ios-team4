//
//  mypageViewController.swift
//  FoodD-day
//
//  Created by jiwon on 2021/07/31.
//

import UIKit

class mypageViewController: UIViewController {

    
    @IBOutlet weak var shareIcon: UILabel!
    @IBOutlet weak var BellSwitch: UISwitch!
    @IBOutlet weak var box: UIView!
    @IBOutlet weak var bottomBar: UIView!
    
    private var shareCounts: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        box.layer.shadowColor = UIColor.black.cgColor
        box.layer.shadowOpacity = 0.15
        box.layer.shadowOffset = .zero
        box.layer.shadowRadius = 10
        
        bottomBar.layer.borderColor = UIColor.gray.cgColor
        bottomBar.layer.borderWidth = 0.15
        bottomBar.layer.cornerRadius = 25
        bottomBar.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        bottomBar.layer.shadowColor = UIColor.black.cgColor
        bottomBar.layer.shadowOpacity = 0.15
        bottomBar.layer.shadowOffset = .zero
        bottomBar.layer.shadowRadius = 5
 
        
        self.setupLabelTap()
        navigationController?.navigationBar.isHidden = true
        
        setNotification()
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        
        guard let vcName = self.storyboard?.instantiateViewController(withIdentifier: "shareViewController") as? shareViewController else {
            return
        }
                vcName.modalPresentationStyle = .fullScreen
                vcName.modalTransitionStyle = .crossDissolve
//                self.present(vcName!, animated: true, completion: nil)
        navigationController?.pushViewController(vcName, animated: true)
        
    }
            
    func setupLabelTap() {
                
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.shareIcon.isUserInteractionEnabled = true
        self.shareIcon.addGestureRecognizer(labelTap)
              

    }
    
    func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(getCounts(_:)), name: NSNotification.Name("postCounts"), object: nil)
    }

    @objc
    func getCounts(_ notification: Notification) {
        shareCounts = notification.object as! Int
        shareIcon.text = "\(shareCounts)"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
