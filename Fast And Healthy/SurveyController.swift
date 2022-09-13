//
//  SurveyController.swift
//  Fast And Healthy
//
//  Created by Joshua on 9/11/22.
//

import UIKit

class SurveyController: UIViewController {

    @IBOutlet var lblQuestion: UILabel!
    @IBOutlet var answer0: UIButton!
    @IBOutlet var answer1: UIButton!
    @IBOutlet var answer2: UIButton!
    @IBOutlet var answer3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
              currentQuestion = questions[0]
              setQuestion()
    }
    
    // Submit an answer
    
    @IBAction func submitAnswer0(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
     
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 1)
    }
     
    @IBAction func submitAnswe2(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    
     
     // Check if an answer is correct then load the next question
     func checkAnswer(idx: Int) {
         if(idx == currentQuestion!.correctAnswer) {
             noCorrect += 1
         }
         loadNextQuestion()
     }
     func loadNextQuestion() {
         // Show next question
         if(currentQuestionPos + 1 < questions.count) {
             currentQuestionPos += 1
             currentQuestion = questions[currentQuestionPos]
             setQuestion()
             print(noCorrect)
         // If there are no more questions show the results
         } else {
             performSegue(withIdentifier: "sgShowResults", sender: nil)
             currentQuestionPos = 0
         }
         

     }
     
     // Set labels and buttions for the current question
     func setQuestion() {
         lblQuestion.text = currentQuestion!.question
         answer0.setTitle(currentQuestion!.answers[0], for: .normal)
         answer1.setTitle(currentQuestion!.answers[1], for: .normal)
         answer2.setTitle(currentQuestion!.answers[2], for: .normal)
         answer3.setTitle(currentQuestion!.answers[3], for: .normal)
     }
     
     // Set the background as a blue gradient
     
     // Before we move to the results screen pass the how many we got correct, and the total number of questions
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if(segue.identifier == "sgShowResults") {
             var vc = segue.destination as! ResultsViewController
             vc.noCorrect = noCorrect
             vc.total = questions.count
             noCorrect = 0
         }
}

}
