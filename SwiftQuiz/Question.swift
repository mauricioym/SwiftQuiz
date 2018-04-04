//
//  Question.swift
//  SwiftQuiz
//
//  Created by Mauricio Miyamura on 03/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import GameplayKit.GKRandomSource

class Question {
    let command: String
    let answer: String
    let options: [String]
    
    init(texts: (command: String, options: [String])) {
        self.command = texts.command
        self.answer = texts.options[0]
        self.options = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: texts.options) as! [String]
    }
    
    func validate(answer: String?) -> Bool {
        return self.answer == answer
    }
}
