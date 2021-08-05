//
//  mypageViewController.swift
//  FoodD-day
//
//  Created by jiwon on 2021/07/30.
//

import UIKit

class shareViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var bottom: UIView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var topBox: UIView!
    @IBOutlet weak var shareTableView: UITableView!
    @IBAction func shareButton(_ sender: Any) {
        animateIn(desiredView: blurView)
        animateIn(desiredView: popUpSearch)
    }
    @IBAction func closedButton(_ sender: Any) {
        animateOut(desiredView: popUpSearch)
        animateOut(desiredView: blurView)
    }
    @IBAction func addClosedButton(_ sender: Any) {
        animateOut(desiredView: popUpAdd)
        animateOut(desiredView: blurView)
    }
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popUpSearch: UIView!
    @IBOutlet var popUpAdd: UIView!
    @IBAction func searchButton(_ sender: Any) {
        animateOut(desiredView: popUpSearch)
        animateIn(desiredView: popUpAdd)
    }
    
    @IBOutlet weak var addField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addImage: UIImageView!
    
    
    
    @IBOutlet weak var addButton: UIButton!
    

//    let titles = [("아몬드"),("그래놀라")]
//    let des = [("삼촌"),("언니")]
//    let images = [UIImage(named: "pAlmond"),
//                  UIImage(named: "pGranola")]
//
    let relation = ["아빠", "엄마", "언니", "오빠", "여동생", "남동생", "할머니", "할아버지", "삼촌", "이모", "룸메이트"]
    var pikerview = UIPickerView()
    var shareCounts: Int = 0
    
    // MARK:- Data Model
    var friends = [FriendDataModel]()
    var newFriend = FriendDataModel(image: "", name: "", relation: "")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        addField.inputView = pikerview
        addField.textAlignment = .center
        addField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBox.layer.shadowColor = UIColor.black.cgColor
        topBox.layer.shadowOpacity = 0.15
        topBox.layer.shadowOffset = .zero
        topBox.layer.shadowRadius = 10
        
        shareTableView.layer.shadowColor = UIColor.black.cgColor
        shareTableView.layer.shadowOpacity = 0.15
        shareTableView.layer.shadowOffset = .zero
        shareTableView.layer.shadowRadius = 10
        shareTableView.layer.masksToBounds = false
        shareTableView.removeExtraCellLines()
        
        shareTableView.delegate = self
        shareTableView.dataSource = self
        
        blurView.bounds = self.view.bounds
        popUpSearch.bounds = CGRect(x: 0, y: 0, width: 315, height: 423)
        popUpAdd.bounds = CGRect(x: 0, y: 0, width: 315, height: 423)
        
        //self.view.bounds.width
        
        pikerview.delegate = self
        pikerview.dataSource = self

        navigationController?.navigationBar.isHidden = true
        setList()
        
        bottom.layer.borderColor = UIColor.gray.cgColor
        bottom.layer.borderWidth = 0.15
        bottom.layer.cornerRadius = 25
        bottom.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        bottom.layer.shadowColor = UIColor.black.cgColor
        bottom.layer.shadowOpacity = 0.15
        bottom.layer.shadowOffset = .zero
        bottom.layer.shadowRadius = 5

    }
    
    func setList() {
        friends.append(contentsOf: [
            FriendDataModel(image: "pAlmond", name: "아몬드", relation: "오빠"),
            FriendDataModel(image: "pGranola", name: "그래놀라", relation: "언니")
        ])
    }

    // MARK: - UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titles.count
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = .gray
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        shareCounts = friends.count
        return "구성원(\(shareCounts))"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! shareTableViewCell
//        cell.pImage.image = self.images[indexPath.row]
//        cell.nameLabel.text = self.titles[indexPath.row]
//        cell.subLabel.text = self.des[indexPath.row]
        cell.initCell(image: friends[indexPath.row].image, name: friends[indexPath.row].name, relaiton: friends[indexPath.row].relation)
        cell.layer.cornerRadius = 25
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Animate
    
    func animateIn(desiredView: UIView){
        let backgroundView = self.view!
        
        backgroundView.addSubview(desiredView)
        
      //  desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
            
            
        })
    }
    
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.3, animations: {
          //  CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }

    @IBAction func popToMypage(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("postCounts"), object: shareCounts)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpAdd(_ sender: Any) {
        newFriend.name = nameLabel.text ?? "이름"
        newFriend.relation = addField.text ?? "관계"
        newFriend.image = "pWalnut"
        
        friends.append(newFriend)
        shareTableView.reloadData()
        pikerview.reloadAllComponents()
        
        addField.text = "관계"
        addField.textColor = .gray
        
        animateOut(desiredView: popUpAdd)
        animateOut(desiredView: blurView)
    }
}

extension shareViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return relation.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return relation[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addField.text = relation[row]
        pikerview.selectRow(0, inComponent: 0, animated: false)
        addField.resignFirstResponder()
    }
}

extension UITableView {
    func removeExtraCellLines() {
        tableFooterView = UIView(frame: .zero)
    }
}
