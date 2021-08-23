//
//  ResultViewController.swift
//  Quiz
//
//  Created by 河村大介 on 2021/08/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int = 0

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(correctAnswer)
        
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
