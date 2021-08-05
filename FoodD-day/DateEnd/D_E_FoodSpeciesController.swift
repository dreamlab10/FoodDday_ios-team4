//
//  D_E_FoodSpeciesController.swift
//  FoodD-day
//
//  Created by Coolkid Nd on 2021/08/02.
//

import UIKit
import Parchment

class D_E_FoodSpeciesController:UIViewController{
    var pagingViewController:PagingViewController!
    
    var viewControllers:[ViewController] = []
    let dayTitles = ["전체","과일 채소", "정육", "수산", "유제품", "양념", "간식"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //화면 만들어서 월~일 컨트롤러목록에 넣음
        for title in dayTitles {
            if let vc = storyboard?.instantiateViewController(identifier: "DateEndCellList")as? ViewController{
            vc.title = title
            viewControllers.append(vc)
            }
            }
        
         pagingViewController = PagingViewController(viewControllers: viewControllers)
        pagingViewController.menuItemSize = .sizeToFit(minWidth: 30, height: 40)
        pagingViewController.menuItemSpacing = 0
        pagingViewController.menuItemLabelSpacing = 0
        pagingViewController.indicatorOptions = .hidden
        pagingViewController.selectedBackgroundColor = .green
        pagingViewController.selectedTextColor = .white
        //  뷰 로드된 후에 A,B.. 만듦
    }
    //메인화면에서 보여줌
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addChild(pagingViewController)
        pagingViewController.view.frame = self.view.frame
        view.addSubview(pagingViewController.view)//실제로 화면에 뜰 요소 지정
        pagingViewController.didMove(toParent: self)//최대한 앞쪽으로 끌어옴
    }
}
