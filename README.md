# 一行代码实现json字典互转
	 let p1String = "{\"name\":\"liming\",\"age\":20,\"sex\":\"man\"}"
	        if let person1 = Person.decodeJSON(from: p1String) {
	            print(person1)
	        }
	        
	        let p1Dic = ["data": ["name":"marvin","age":30,"sex":"男"],"code":2,"message": "OK?"] as [String : Any]
	        if let base = MDBaseModel<Person>.decodeJSON(from: p1Dic) {
	            print(base.data!.userName)
	        }
	        
	        
	        if let person = Person.decodeJSON(from: p1Dic, designatedPath: "data") {
	            print(person.userName)
	            let jsonString = person.toJSONString()
	            print(jsonString!)
	        }