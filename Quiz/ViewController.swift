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

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var thirdImage: UIImageView!
    
    @IBOutlet weak var FourthImage: UIImageView!
    
    @IBOutlet weak var StartBtn: UIButton!
    
    @IBOutlet weak var SubmitBtn: UIButton!
    
    @IBOutlet weak var RestartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 加载数据
        loadData()
        
        // 加载UI
        setupUI()
    }
    
    
    private func loadData()  {

        SVProgressHUD.show()
        DTQuizManager.shared.loadQuiz(successBlock: { (quizList) in
            SVProgressHUD.dismiss()
            
            

            print(view!)
        }, failureBlock: {_ in
            SVProgressHUD.showError(withStatus: "load error")
        })
    }
    

    private func setupUI(){
        
    }


}

