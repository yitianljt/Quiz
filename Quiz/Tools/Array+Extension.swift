//
//  Array+Extension.swift
//  Quiz
//
//  Created by jin tao on 2017/10/9.
//  Copyright © 2017年 jin tao. All rights reserved.
//

import Foundation


extension Array{
    public func shuffleAns() -> [AnyObject] {
        let oldArray = NSMutableArray.init(array: self)
        var newArray = [AnyObject]()
        
        while oldArray.count != 0 {
            let randIndex = Int(arc4random()) % oldArray.count
            newArray.append(oldArray.object(at: randIndex) as AnyObject)
            
            oldArray.removeObject(at: randIndex)
        }
        
        return newArray as [AnyObject];
    }
    
}
