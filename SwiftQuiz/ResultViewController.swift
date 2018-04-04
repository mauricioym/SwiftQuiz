//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Mauricio Miyamura on 03/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbUnanswered: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalQuestions = 0
    var totalCorrectAnswers = 0
    var totalWrongAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbTotal.text = "Total de perguntas: \(totalQuestions)"
        lbCorrect.text = "Respostas corretas: \(totalCorrectAnswers)"
        lbWrong.text = "Respostas erradas: \(totalWrongAnswers)"
        lbUnanswered.text = "Não respondidas: \(totalQuestions - totalCorrectAnswers - totalWrongAnswers)"
        lbScore.text = "\(totalCorrectAnswers * 100 / totalQuestions)%"
    }

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
