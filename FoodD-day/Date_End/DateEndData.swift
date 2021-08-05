//
//  DateEndData.swift
//  FoodD-day
//
//  Created by Coolkid Nd on 2021/08/02.
//

struct DateEndData {
    var title_image:String!
    var title:String!
    var date:String!
    var end_date:String!
    
    init(_ title_image:String, _ title:String, _ date:String, _ end_date:String) {
        self.title_image = title_image
        self.title = title
        self.date = date
        self.end_date = end_date
    }
}

