//
//  ViewController.swift
//  MarubatsuApp3
//
//  Created by VERTEX22 on 2019/08/03.
//  Copyright © 2019 N-project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 1、クイズラベルの紐付け
    @IBOutlet weak var questionLabel: UILabel!

    // 3,現在のクイズ番号を管理
    var currentQuestionNum: Int = 0
    
    // 問題を管理
    let questions: [[String: Any]] = [
        [ "question": "1 + 1 = 2 である",
          "answer": true
        ],
        [ "question": "石川県は四国地方である",
          "answer": false
        ],
        [ "question": "トマトは夏野菜である",
          "answer": true
        ],
        [ "question": "つくば市は栃木県である",
          "answer": false
        ],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // 2,◯ボタンの紐付け
   
    @IBAction func tappedYesButton(_ sender: UIButton) {
        
    }
    
    // 2,xボタンの紐付け
    @IBAction func tappedNoButton(_ sender: UIButton) {
        
    }


    //問題を表示する関数
    func shouQuestion(){
        //currentQuestion(問題番号)の問題を取得
        let question = questions[currentQuestionNum]
        
        //問題(辞書)からkeyを指定して問題を取得
        if let que = question["question"] as? String{
            // question key の中身をlabelに代入
            questionLabel.text = que
        }
    }
    
    
    
    
    
}


