//
//  DTQuestionModel.swift
//  Quiz
//
//  Created by jin tao on 2017/10/9.
//  Copyright © 2017年 jin tao. All rights reserved.
//

import UIKit

class DTQuestionModel: NSObject {
    var title: String;
    var orginalAnswers: [String]
    
    

    init(key: String, answers: [String]){
        title = key
        orginalAnswers = answers
        
        super.init()
    }
}
