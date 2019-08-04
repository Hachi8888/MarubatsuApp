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
    
    // ★正解数のカウント
    var collectNum: Int = 0
    
    // 問題を管理
    let questions: [[String: Any]] = [
    [ "question": "1 + 1 = 2 である",
    "answer": true,
    "hint": "たんぼのた"
    ],
    [ "question": "石川県は四国地方である",
    "answer": false,
    "hint": "日本海に面しています"
    ],
    [ "question": "トマトは夏野菜である",
    "answer": true,
    "hint": "真っ赤な太陽がかがやく季節に実ります"
    ],
    [ "question": "つくば市は栃木県である",
    "answer": false,
    "hint": "秋葉原から45分!"
    ],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showQuestion()
        
    }
    
    
    // 2,◯ボタンの紐付け
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        //◯ボタンを押したときの動作
        checkAnswer(yourAnswer: true)
        
    }
    
    // 2,xボタンの紐付け
    @IBAction func tappedNoButton(_ sender: UIButton) {
        //☓ボタンを押したときの動作
        checkAnswer(yourAnswer: false)
    }
    
    //アラートを表示する関数
    func showAlert(message: String){
        //アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        //アラートのアクション(ボタンの定義)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        //作成したalertに閉じるボタンを追加
        alert.addAction(close)
        //アラートを表示する
        present(alert, animated: true, completion: nil)
    }
    
    // ★問題の最後に正解数を表示する関数
    func showCollectNum(message: String){
        
        //アラートの作成
        let alert2 = UIAlertController(title: "結果発表" ,message: message, preferredStyle: .alert)
        
        //
        let close2 = UIAlertAction(title: "閉じる", style: .cancel,handler: nil)
        
        //作成したalertに閉じるボタンを追加
        alert2.addAction(close2)
        
        //アラートを表示する
        present(alert2, animated: true, completion: nil)
    }
    
    
    //問題を表示する関数
    func showQuestion(){
        //currentQuestion(問題番号)の問題を取得
        let question = questions[currentQuestionNum]
        
        //問題(辞書)からkeyを指定して問題を取得
        if let que = question["question"] as? String{
            // question key の中身をlabelに代入
            questionLabel.text = que
        }
    }
    
    
    // ★正解数を表示するための関数
    func checkLastAnswer(){
        // 正解数の結果発表
        showAlert(message:"\(questions.count)問中\(collectNum)問正解です!")
        
    }
    
    // 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {
        
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            
            if yourAnswer == ans {
                // 正解
                // currentQuestionNumを1足して次の問題に進む
                // 回答するとcurrentQuestionNumに1を足す(問題を進める)
                
                // ★正解するとcollectNumに1を足す(正解数のカウント)
                
                
                //最終問題かチェック、そうならば結果を表示
                if currentQuestionNum >=  questions.count - 1 {
                    checkLastAnswer()
                    currentQuestionNum = 0
                    return
                } else {
                    showAlert(message: "【祝】正解です")
                    currentQuestionNum += 1
                    collectNum += 1
                }
                
            } else if yourAnswer != ans {
                // 不正解
                if currentQuestionNum >= questions.count - 1 {
                    checkLastAnswer()
                    currentQuestionNum = 0
                    return
                    
                } else {
                    showAlert(message: "不正解です")
                    
                    // 回答するとcurrentQuestionNumに1を足す(問題を進める)
                    currentQuestionNum += 1
                    
                    
                }
                
            } else {
                print("答えが入ってません")
                return
            }
        }
        
        
        

        
    
        //         問題を表示します。
        //        正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
        showQuestion()
    }
    
    
}




