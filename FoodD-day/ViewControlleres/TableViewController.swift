//
//  ViewController.swift
//  FoodD-day
//
//  Created by Apple on 2021/07/29.
//

import UIKit
//import FirebaseDatabase
//import AlamofireImage

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //var datasource = [1,2,3,4,5,6,7]
    var foodImages = ["img11","img22","img33","img_4","img_5"]
    var foodData = ["전체":[
        FoodData("다이제", "#땅콩꺼 #내방", "다이제","bar1"),
        FoodData("소금", "#장식장 #서늘", "소금","bar2"),
        FoodData("토마토", "#냉장고 #대저", "토마토", "bar5"),
        FoodData("돼지고기", "#냉장고 #삼겹살", "돼지", "bar1"),
        FoodData("치즈", "#냉장고 #체다", "치즈", "bar1")
    ],
    
    "과일 채소":[
        FoodData("토마토", "#냉장고 #대저", "토마토", "bar5"),
        FoodData("상추", "#적상추 #삽겹살이랑", "상추", "bar1"),
    ],
    "육류":[
        FoodData("토마토", "#냉장고 #체다", "돼지", "bar5"),
       // FoodData("사과", "#냉장고 #체다", "img_4", "bar1"),
    ],
    "수산":[
        FoodData("토마토", "#냉장고 #체다", "img33", "bar5"),
        FoodData("사과", "#냉장고 #체다", "img_4", "bar1"),
    ],
    "유제품":[
        FoodData("치즈", "#냉장고 #체다", "img11", "bar5"),
    ],
    "양념":[
        FoodData("토마토", "#냉장고 #체다", "img33", "bar5"),
        FoodData("사과", "#냉장고 #체다", "img_4", "bar1"),
    ],
    "간식":[
        FoodData("토마토", "#냉장고 #체다", "img33", "bar5"),
        FoodData("사과", "#냉장고 #체다", "img_4", "bar1"),
    ],
    ]
    
    var foodDataFruit = [
        FoodData("토마토", "#냉장고 #체다", "img33", "bar5"),
        FoodData("사과", "#냉장고 #체다", "img_4", "bar1"),
    ]
    
    
    /*
    // 실시간 데이터베이스를 이용하여 사진 추가
    // 데이터베이스레퍼런스 선언
    var ref: DatabaseReference!
    var refHandle: DatabaseHandle!
    var imageUrls = [String]()
   */
    
    @IBOutlet weak var tableView: UITableView!
    
    // 셀 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return foodData[self.title!]!.count
    }
    
    // 셀 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainCell
        cell.innerView.layer.borderWidth = 0.1
        cell.innerView.layer.borderColor = UIColor.gray.cgColor
        cell.innerView.layer.cornerRadius = 25
        cell.innerView.layer.shadowColor = UIColor.black.cgColor
        
        // 음식 데이터
        var data:FoodData = foodData[self.title!]![indexPath.row]
        
        cell.foodName.text = data.foodName
        cell.foodTag.text = data.foodTag
        cell.foodImage.image = UIImage(named: data.food_image)
        cell.foodBar.image = UIImage(named: data.foodBar)
        
        /*실시간
        let url = URL(string: datasource[indexPath.row])!
        cell.foodImage.af.setImage(withURL: url)*/
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    // 편집,수정 가능 조건 지정
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //let row = indexPath.row
        return true
    }
    
    // 셀 움직이기
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return false
    }
    
    // 왼쪽 편집 이미지 안보이기
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    // 편집 이미지 여백 안보이기
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    // 셀 오른쪽 끝에 나타날 버튼들
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let btnEdit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in
            
            completion(true)
        }
        
        let btnDelete = UIContextualAction(style: .destructive, title: "Del") { (action, view, completion) in
            
            let row = indexPath.row
            self.foodImages.remove(at: row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        
        btnEdit.backgroundColor = .blue
        //btnDelete.backgroundColor = .black
        return UISwipeActionsConfiguration(actions: [btnEdit, btnDelete])
    }
    
    /*
    // 데이터 순서 바꾸기
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let fromRow = sourceIndexPath.row
        let toRow = destinationIndexPath.row
        let data = datasource[fromRow]
        datasource.remove(at: fromRow)
        
        datasource.insert(data, at: toRow)
        
        tableView.reloadData()
    }

    
    // 셀 왼쪽 시작부분에 나타날 버튼들
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let btnShare = UIContextualAction(style: .normal, title: "Share") { (action, view, completion) in
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [btnShare])
    }
    */
    // 셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    @IBOutlet weak var itemNumber: UIView!
    @IBOutlet weak var orderBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // 실시간 데이터 사용하여 식품 사진 추가
        ref = Database.database().reference()
        ref.observe(.value) { (snapshot) in }
        
        refHandle = ref.child("users/food/images").observe(DataEventType.value, with: { snapshot in
            self.imageUrls = [String]()
            let imageDict = snapshot.value as? [String : AnyObject] ?? [:]
            //debugPrint(imageDict)
            for (key, value) in imageDict {
                self.imageUrls.append(value["image_url"]!! as! String)
            }
            self.tableView.reloadData()
            print(self.imageUrls)
    })*/
        
        // 셀 클릭 시 상세페이지로 이동
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("selected")
            tableView.deselectRow(at: indexPath, animated: false)
            performSegue(withIdentifier: "goDetail", sender: self)
        }

        
        // 품목, 버튼 UI
        itemNumber.layer.borderWidth = 0.1
        itemNumber.layer.borderColor = UIColor.gray.cgColor
        itemNumber.layer.cornerRadius = 15
        
        orderBtn.layer.borderWidth = 0.1
        orderBtn.layer.borderColor = UIColor.gray.cgColor
        orderBtn.layer.cornerRadius = 15
        
        
        // 테이블뷰 편집 가능
        self.tableView.isEditing = true
        
        // 화면 쭉 스크롤하면 새로고침
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .cyan
        refreshControl.addTarget(self, action: #selector(fetchData(_:)), for: .valueChanged)
        //tableView.refreshControl = refreshControl
    }

    // 화면 쭉 스크롤하면 새로고침 동작시키기
    @objc func fetchData(_ sender:Any) {
        tableView.refreshControl?.endRefreshing()
    }
    
    @IBAction func changeOrder(_ sender: UIButton) {
        self.tableView.isEditing.toggle()
    }
    
}



