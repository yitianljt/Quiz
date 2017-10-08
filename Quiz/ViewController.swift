//
//  ViewController.swift
//  Quiz
//
//  Created by jin tao on 2017/10/9.
//  Copyright © 2017年 jin tao. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 加载数据
        loadData()
    }
    
    
    func loadData()  {

        SVProgressHUD.show()
        DTQuizManager.shared.loadQuiz(successBlock: { (quizList) in
            SVProgressHUD.dismiss()
            

            print(view!)
        }, failureBlock: {_ in
            SVProgressHUD.showError(withStatus: "load error")
        })
    }


}

