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
    func loadQuiz(successBlock: (_ quizList: NSArray) ->(), failureBlock: (_ error: Error)->()) {
        
        guard
            let path = Bundle.main.path(forResource: "zquestions.json", ofType: nil),
            let data = NSData(contentsOfFile: path),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject]
        else {
            // 出错
            failureBlock(NSError.init(domain: "error", code: DTQuizManager.DTQuizeLoadDataError, userInfo: nil))
            return
        }
        
    
        var result = [AnyObject]()
        // 构造数组
        for (_, value) in dict! {
            result.append(value)
        }
        
        
        
        successBlock(result as NSArray)
    }
    
    
}
