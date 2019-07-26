//
//  ViewController.swift
//  JsonToModel
//
//  Created by  MarvinChan on 2019/7/25.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

struct MDBaseModel<T: Codable>: Codable {
    var data: T?
    var code: String?
    var message: String?
}
//首先定义一个结构体Person用来表示数据Model
struct Person: Codable {
    var userName: String?
    var age: Int?
    var sex: String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "name"
        case age
        case sex
    }
    
}




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1String = "{\"name\":\"liming\",\"age\":20,\"sex\":\"man\"}"
        if let person1 = Person.decodeJSON(from: p1String) {
            print(person1)
        }
        

        
        let personJson = """
{
    "data": [
        {
            "name": "marvin",
            "age": 21,
            "sex": "男"
        },
        {
            "name": "marvin",
            "age": 21,
            "sex": "男"
        }
    ],
    "code": 2,
    "message": "eew"
}
"""
        let p1Dic = ["data": ["name":"marvin","age":30,"sex":"男"],"code":"2","message": "OK?"] as [String : Any]
        if let base = MDBaseModel<[Person]>.decodeJSON(from: personJson) {
            print(base.data?.first?.userName ?? "")
        }
        
        
//        if let person = Person.decodeJSON(from: p1Dic, designatedPath: "data") {
//            print(person.userName ?? "")
//            let jsonString = person.toJSONString()
//            print(jsonString!)
//        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }



}

