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
    
    @IBOutlet weak var fourthImage: UIImageView!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var restartBtn: UIButton!
    
    var dataSource = [DTQuestionModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 加载数据
        loadData()
        
        // 加载UI
        setupUI()
        
        // 初始化UI
        beforStartUI()
    }
    
    
    private func loadData()  {

        SVProgressHUD.show()
        DTQuizManager.shared.loadQuiz(successBlock: { [weak self] (quizList)  in
            SVProgressHUD.dismiss()

            self?.dataSource = quizList
            // test
            var model = quizList.first
            guard let url = model?.shuffleAns().first else {
                return
            }

            self?.firstImage.sd_setImage(with: URL.init(string: url), completed: nil)

            
        }, failureBlock: {_ in
            SVProgressHUD.showError(withStatus: "load error")
        })
    }
    


    private func setupUI(){
        startBtn.addTarget(self, action: #selector(startClick), for: .touchUpInside)
        submitBtn.addTarget(self, action: #selector(submitClick), for: .touchUpInside)
        restartBtn.addTarget(self, action: #selector(restartClick), for: .touchUpInside)
    }
    
    private func beforStartUI(){
        titleLabel.isHidden = true
        firstImage.isHidden = true
        firstImage.isHidden = true
        secondImage.isHidden = true
        thirdImage.isHidden = true
        fourthImage.isHidden = true
        submitBtn.isHidden = true
        restartBtn.isHidden = true
        
        startBtn.isHidden = false;

    }
    
    private func startQuiz(){
        titleLabel.isHidden = false
        firstImage.isHidden = false
        firstImage.isHidden = false
        secondImage.isHidden = false
        thirdImage.isHidden = false
        fourthImage.isHidden = false
        submitBtn.isHidden = false
        
        
    }

    @objc private func startClick(){
        startQuiz()
    }
    
    @objc private func submitClick(){
        
    }
    
    @objc private func restartClick(){
        startQuiz()
    }

}

