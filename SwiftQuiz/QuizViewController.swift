//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Mauricio Miyamura on 03/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var timerEndConstraint: NSLayoutConstraint!
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestionNumber: UILabel!
    @IBOutlet weak var lbCommand: UILabel!
    @IBOutlet var btOptions: [UIButton]!
    
    var quizManager: QuizManager!
    var question: Question!
    var totalQuestions = 0
    var correctAnswers = 0
    var wrongAnswers = 0
    var resultShowed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timerEndConstraint.constant = 0
        
        quizManager = QuizManager()
        totalQuestions = quizManager.count
        correctAnswers = 0
        wrongAnswers = 0
        resultShowed = false
        question = quizManager.question()
        refresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timerEndConstraint.constant = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
        }) { (success) in
            self.showResult()
        }
    }
    
    func refresh() {
        lbQuestionNumber.text = "Questão \(correctAnswers + wrongAnswers + 1)/\(totalQuestions)"
        lbCommand.text = question.command
        for (index, option) in question.options.enumerated() {
            btOptions[index].setTitle(option, for: .normal)
        }
    }
    
    @IBAction func optionClicked(_ sender: UIButton) {
        let chosenOption = sender.titleLabel?.text
        let isCorrect = question.validate(answer: chosenOption)
        if isCorrect {
            correctAnswers += 1
        } else {
            wrongAnswers += 1
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            sender.backgroundColor = isCorrect ? .green : .red
            sender.setTitleColor(.white, for: .normal)
        }) { (success) in
            sender.backgroundColor = .white
            sender.setTitleColor(.darkGray, for: .normal)
            self.nextQuestion()
        }
    }
    
    func nextQuestion() {
        if let newQuestion = quizManager.question() {
            question = newQuestion
            refresh()
        } else {
            showResult()
        }
    }
    
    func showResult() {
        if !resultShowed {
            resultShowed = true
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        resultVC.totalQuestions = totalQuestions
        resultVC.totalCorrectAnswers = correctAnswers
        resultVC.totalWrongAnswers = wrongAnswers
    }

}
