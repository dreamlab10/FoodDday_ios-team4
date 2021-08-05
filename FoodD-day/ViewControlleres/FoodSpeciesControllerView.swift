//
//  FoodSpeciesControllerView.swift
//  FoodD-day
//
//  Created by Apple on 2021/07/30.
//

import UIKit
import Parchment

class FoodSpeciesViewController:UIViewController, PagingViewControllerDelegate {
    var pagingViewController:PagingViewController!
    //화면뷰 여러개 만들기
    //각각의 뷰가 라벨에 따라 들어옴
    var viewControllers:[TableViewController]! = []
    let foodSpeciesTitles = ["전체","과일 채소","육류","수산","유제품","양념","간식"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for title in foodSpeciesTitles {
            if let vc = storyboard?.instantiateViewController(identifier: "FoodTableView") as? TableViewController {
                vc.title = title
                viewControllers.append(vc)
            }
        }
        print("aaaaa")
        pagingViewController = PagingViewController(viewControllers: viewControllers)
        pagingViewController.delegate = self
        pagingViewController.menuItemSize = .fixed(width: 60, height: 40)
        //pagingViewController.menuItemSize = .sizeToFit(minWidth: 30, height: 40)
        pagingViewController.menuItemSpacing = 10
        pagingViewController.menuItemLabelSpacing = 0
        pagingViewController.indicatorColor = .systemGreen
        pagingViewController.selectedTextColor = .systemGreen
        //UIFont.systemFont(ofSize: 60, weight: UIFont.Weight.medium)
        
        
        
        
        
        
    }
    
    func pagingViewController(_ pagingViewController: PagingViewController, didScrollToItem pagingItem: PagingItem, startingViewController: UIViewController?, destinationViewController: UIViewController, transitionSuccessful: Bool) {
        
    }
    func pagingViewController(_ pagingViewController: PagingViewController, didSelectItem pagingItem: PagingItem) {
        // scroll
        print("scroll")
        //pagingViewController.select(pagingItem: <#T##PagingItem#>)
        //pagingViewController.collectionView(PagingView:UIViewController, didSelectItemAt: indexPath) {
    }
    
    
    //foodData를 화면에 보여줌
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addChild(pagingViewController)
        pagingViewController.view.frame = self.view.frame
        // 화면에 뜰 요소 지정
        view.addSubview(pagingViewController.view)
        // pagingViewController를 최대한 앞쪽으로 오게함
        pagingViewController.didMove(toParent: self)
    }
}
