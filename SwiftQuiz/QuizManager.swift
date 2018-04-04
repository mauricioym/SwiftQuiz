//
//  QuizManager.swift
//  SwiftQuiz
//
//  Created by Mauricio Miyamura on 03/04/18.
//  Copyright © 2018 Yuddi. All rights reserved.
//

import Foundation

class QuizManager {
    private var quiz: [(command: String, options: [String])] = [
        (command: "Quais desses é string?",
         options: ["\"Olá mundo\"",
                   "20",
                   "Olá mundo",
                   "'Olá mundo'"]),
        (command: "Qual é o resultado da expressão \"1\" + \"1\"?",
         options: ["\"11\"",
                   "11",
                   "\"2\"",
                   "\"1 1\""]),
        (command: "Qual desses símbolos é usado para \"escapar\" caracteres especiais?",
         options: ["\\",
                   "/",
                   "!",
                   "ESC"]),
        (command: "Qual a sintaxe correta para declarar uma função?",
         options: ["func myFunction() {}",
                   "func = myFunction() {}",
                   "let myFunction = func() {}",
                   "let func = myFunction() {}"]),
        (command: """
               func printSomething() {
                  print("Adoro funções")
               }
               printSomething()
            """,
         options: ["Adoro funções",
                   "Nada",
                   "printSomething()",
                   "Erro"]),
        (command: "Quando não declaramos o tipo de retorno de uma função, qual é o retorno padrão?",
         options: ["Void",
                   "Int",
                   "String",
                   "nil"]),
        (command: "Qual é o tipo de uma variável String que pode aceitar nil?",
         options: ["String?",
                   "String",
                   "Int",
                   "Void"]),
        (command: "Quando queremos declarar uma constante, qual palavra reservada devemos usar?",
         options: ["let",
                   "var",
                   "const",
                   "CONST"]),
        (command: "O que é um dicionário?",
         options: ["É uma coleção não-ordenada com chave e valor",
                   "É uma coleção que não aceita objetos repetidos",
                   "É uma coleção ordenada com chave e valor",
                   "É uma coleção que permite valores de tipos diferentes"]),
        (command: "Qual o nome do tipo especial em Swift que é usado para declarar blocos ou funções anônimas?",
         options: ["Closure",
                   "Lambda",
                   "Block",
                   "Protocol"]),
        (command: "O que é um enum?",
         options: ["Tipo definido pelo usuário para um grupo de valores relacionados",
                   "É um conjunto de Strings",
                   "É um tipo especial de String",
                   "É um operador unário do tipo prefix"]),
        (command: "O que uma extension não pode fazer?",
         options: ["Adicionar propriedades armazenadas",
                   "Adicionar novas funcionalidades",
                   "Definir novos construtores",
                   "Adicionar propriedades computadas"]),
        (command: "Quando herdamos de uma classe e queremos chamar o seu construtor, usamos...",
         options: ["super.init",
                   "main.init",
                   "self.init",
                   "super"])]
    
    var count: Int {
        return quiz.count
    }
    
    func question() -> Question? {
        if quiz.count > 0 {
            let index = Int(arc4random_uniform(numericCast(quiz.count)))
            return Question(texts: quiz.remove(at: index))
        } else {
            return nil
        }
    }
}
