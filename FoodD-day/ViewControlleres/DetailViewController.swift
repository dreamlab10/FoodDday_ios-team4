//
//  DetailViewController.swift
//  FoodD-day
//
//  Created by Apple on 2021/07/30.
//

import UIKit

let backdropBaseView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = true

    return view
}()

class DetailViewController:UIViewController {
    var recievedTitle:String?
    var recievedTag:String?
    var recievedMemo:String?
    var recievedCategory:String?
    var recievedPlace:String?
    var recievedCount:String?
    var recievedDate:String?
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var recieveProductName: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dateLabel: UIView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cornerView.layer.cornerRadius = 25
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
  //      recieveProductName.text = recievedTitle
//        countLabel.text = recievedCount
  //      placeLabel.text  = recievedPlace
  //      tagLabel.text = recievedTag
 //       memoTextView.text = recievedMemo
 //       categoryLabel.text = recievedCategory
    }
    
}
