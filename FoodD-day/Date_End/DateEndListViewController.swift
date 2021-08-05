//
//  DateEndListViewController.swift
//  FoodD-day
//
//  Created by Coolkid Nd on 2021/08/02.
//

import UIKit

class DateEndListViewController: UIViewController,UICollectionViewDataSource,
                                 UICollectionViewDelegate {
    
    
    
    var dateenddata = [
        DateEndData("img_1", "목살", "2021.06.07", "2021.06.21"),
        DateEndData("img_2", "복숭아", "2021.06.07", "2021.06.21"),
        DateEndData("img_3", "오뚜기 참기름", "2021.06.07", "2021.06.21"),
        DateEndData("img_4", "감자", "2021.06.07", "2021.06.21"),
        DateEndData("img_5", "다이제", "2021.06.07", "2021.06.21"),
        DateEndData("img_6", "비비고 만두", "2021.06.07", "2021.06.21"),
    ]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateenddata.count*6
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateEndCell", for: indexPath)as! DataEndCell
        
        
        let data = dateenddata[indexPath.row%6]
        cell.titleLabel.text = data.title
        cell.dateLabel.text = "\(data.date!)"//optional !붙이면 무시가능
        cell.enddateLabel.text = data.end_date
        //타이틀이미지 변경
        cell.title_image.image = UIImage(named: data.title_image)
        
        cell.endView.layer.cornerRadius = 15
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 3

        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.masksToBounds = false
        cell.title_image.clipsToBounds = true
        cell.title_image.layer.cornerRadius = 15
        cell.title_image.layer.maskedCorners =   CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner)
        
        cell.purpleView.layer.cornerRadius = 5
        cell.yellowView.layer.cornerRadius = 5
                

      


        
        return cell

    }
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let width = self.view.frame.size.width/3
        let width = UIScreen.main.bounds.width/2
        let height = width*1.5
        return CGSize(width: width, height: height)
    }
}



