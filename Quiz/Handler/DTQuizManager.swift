//
//  DTQuizManager.swift
//  Quiz
//
//  Created by jin tao on 2017/10/9.
//  Copyright © 2017年 jin tao. All rights reserved.
//

import UIKit

class DTQuizManager: NSObject {
    static let shared = DTQuizManager()
    
    // 错误
    static let DTQuizeLoadDataError = 1000;
    
    // 加载
    func loadQuiz(successBlock: (_ quizList: [DTQuestionModel]) ->(), failureBlock: (_ error: Error)->()) {
        
        guard
            let path = Bundle.main.path(forResource: "zquestions.json", ofType: nil),
            let data = NSData(contentsOfFile: path),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject]
        else {
            // 出错
            failureBlock(NSError.init(domain: "error", code: DTQuizManager.DTQuizeLoadDataError, userInfo: nil))
            return
        }
        
    
        var result = [DTQuestionModel]()
        // 构造数组
        for (key, value) in dict! {
            let model = DTQuestionModel.init(key: key, answers: value as! [String])
            result.append(model)
        }

        successBlock(result)
    }
    
    
}
