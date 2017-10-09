//
//  DTQuestionModel.swift
//  Quiz
//
//  Created by jin tao on 2017/10/9.
//  Copyright © 2017年 jin tao. All rights reserved.
//

import UIKit

class DTQuestionModel: NSObject {
    
    let maxAswerCount = 4;
    var title: String;
    var orginalAnswers: [String]
    
    // 初始化
    init(key: String, answers: [String]){
        title = key
        orginalAnswers = answers
        
        super.init()
    }
    
    // 答案
    var aswers: [String]{
        get{
            return self.shuffleAns();
        }
    }
    
    // 正确答案
    var correctAnswer: String{
        get{
            // 异常情况没有正确答案
            return orginalAnswers.first ?? ""
        }
    }
    
    // 乱序
     func shuffleAns() -> [String] {
        var newArray = [String]()
        
        while orginalAnswers.count != 0 {
            let randIndex = Int(arc4random()) % maxAswerCount
            newArray.append(orginalAnswers.remove(at: randIndex))
        }
        
        return newArray;
    }
}
