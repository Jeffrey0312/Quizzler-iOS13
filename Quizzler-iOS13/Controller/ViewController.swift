//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var queestionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
  
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
                
                let answerChoices = quizBrain.getAnswers()
                choice1.setTitle(answerChoices[0], for: .normal)
                choice2.setTitle(answerChoices[1], for: .normal)
                choice3.setTitle(answerChoices[2], for: .normal)
                
                progressBar.progress = quizBrain.getProgress()
                scoreLabel.text = "Score: \(quizBrain.getScore())"
                
                choice1.backgroundColor = UIColor.clear
                choice2.backgroundColor = UIColor.clear
                choice3.backgroundColor = UIColor.clear
        
    }

}

