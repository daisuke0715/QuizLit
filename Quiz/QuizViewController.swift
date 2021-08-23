//
//  QuizViewController.swift
//  Quiz
//
//  Created by 河村大介 on 2021/08/23.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray: [Any] = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet weak var quizTextView: UITextView!
    
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["Appleの2015年現在のCEOの名前は？", "スティーブ・ジョブズ", "ティム・クック", "ジョナサン・アイブ", 2])
        quizArray.append(["iPhone6s, iPhone6s Plusから新たに導入された画面タッチの指の圧力を検知する機能をなんという？", "3Dタッチ", "4Dタッチ", "スーパータッチ", 1])
        quizArray.append(["iPod touchのモデルの中で最大容量のものは何GB？", "64GB", "128GB", "256GB", 2])
        quizArray.append(["1985年、Appleを追放されたジョブズが立ち上げた会社名の正式表記は？", "NEXt, Inc.", "NExT, Inc.", "NeXT, Inc.", 3])
        quizArray.append(["2015m年9月30日にリリースされたOSXの名前は？", "El Captain", "El Capitan", "El Capital", 2])
        quizArray.append(["Apple WatchはiPhoneとどんな通信方式でペアリングされる？", "FM電波", "Wi-Fi", "Bluetooth", 3])
        
        quizArray.shuffle()
        
        choiceQuiz()
        
    }
    
    
    
    func choiceQuiz() {
        // 一時的にクイズを取り出しておく変数
        let tmpArray = quizArray[0] as! [Any]
        
        // 問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultVC = self.storyboard?.instantiateViewController(identifier: "resultVC") as! ResultViewController
            resultVC.correctAnswer = self.correctAnswer
        }
    }
    
    
    
    @IBAction func choiceAnswer(sender: UIButton) {
        
        print(sender.tag)
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            // 正解数を増やす
            correctAnswer += 1
        }
        
        // 回答した問題を配列から削除する
        quizArray.remove(at: 0)
        
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
        
        
        
    }

}
