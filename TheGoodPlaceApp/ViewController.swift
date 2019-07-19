//
//  ViewController.swift
//  TheGoodPlaceApp
//
//  Created by Girls Who Code on 7/10/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0

    @IBAction func answer1(_ sender: Any) {
        checkAnswer(choiceNo: 1)
    }
    
    @IBAction func answer2(_ sender: Any) {
        checkAnswer(choiceNo: 2)
    }
    
    @IBAction func answer3(_ sender: Any) {
        checkAnswer(choiceNo: 3)
    }
    
    @IBAction func answer4(_ sender: Any) {
        checkAnswer(choiceNo: 4)
    }
    
    @IBOutlet weak var questionnumber: UILabel!

    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var answer4: UIButton!

    struct Question {
        let question: String
        let correctAnswer: Int
        let answers: [String]
    }
        var questions: [Question] = [
            Question(question: "Who is Jason Mendoza's hero?", correctAnswer: 4, answers: ["Aaron Rogers", "Tom Brady", "LeBron James", "Blake Bortles"]),
            
        Question(question: "What's the full name of Gen, the all knowing judge?" , correctAnswer: 2, answers: ["Genevieve", "Hydrogen", "Nitrogen", "Jenny"]),
        
        Question(question: "What iconic phrase does Eleanor accidentally create?", correctAnswer: 3, answers: ["dance like nobody's watching", "c'est la vie", "Pobody's Nerfect", "There's always tomorrow"]),
        Question(question: "What's the name of Tahani's famous award winning sister?", correctAnswer: 1, answers:["Kamilah", "Deirde", "Angelique", "Colette"])]
    
    
    


        func loadNextQuestion () {
            if((currentQuestionPosition+1) == questions.count) {
                performSegue(withIdentifier:"sgShowResults", sender: nil)
            }
            else {
                currentQuestionPosition += 1
                currentQuestion = questions[currentQuestionPosition]
                setQuestion()
            }
            
        }
    // to do
        func setQuestion() {
            questionLabel.text = currentQuestion!.question
            answer1.setTitle(currentQuestion!.answers[0],for: .normal )
            answer2.setTitle(currentQuestion!.answers[1],for: .normal)
            answer3.setTitle(currentQuestion!.answers[2], for: .normal)
            answer4.setTitle(currentQuestion!.answers[3], for: .normal)
            questionLabel.text = "Question \(currentQuestionPosition+1) of \(questions.count)"
    }
    
    func checkAnswer(choiceNo: Int){
        if(choiceNo == currentQuestion!.correctAnswer){
            noCorrect += 1
            loadNextQuestion()
        } else {
            loadNextQuestion()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! ResultsViewController
        vc.noCorrect = noCorrect
        vc.total = questions.count
    }
        
}

