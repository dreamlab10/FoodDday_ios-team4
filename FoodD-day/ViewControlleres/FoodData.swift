//
//  FoodData.swift
//  FoodD-day
//
//  Created by Apple on 2021/08/05.
//

struct FoodData {
    var food_image:String!
    var foodName:String!
    var foodTag:String!
    var foodBar:String!
    
    
    init(_ foodName:String, _ foodTag:String,_ food_image:String,_ foodBar:String) {
        self.foodName = foodName
        self.foodTag = foodTag
        self.food_image = food_image
        self.foodBar = foodBar
    }
}

/*
var FruitfoodData:FoodData = FoodData(_ foodName:String, _ foodTag:String,_ food_image:String,_ foodBar:String) {
    
}*/
