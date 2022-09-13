//
//  Question.swift
//  Fast And Healthy
//
//  Created by Joshua on 9/11/22.
//

struct Question {
       let question: String
       let answers: [String]
       let correctAnswer: Int
   }
   
   
   var questions: [Question] = [
       Question(
           question: "How long have you been using your running shoes?",
           answers: ["0-2 months", "2-4 months", "4-6 months", ""],
           correctAnswer: 2),
       Question(
           question: "How many miles do your running shoes have?",
           answers: ["0-100", "100-300", "300-500", "Not Sure"],
           correctAnswer: 2),
       Question(
           question: "Are you feeling any new pain while running?",
           answers: ["Yes", "No", "", ""],
           correctAnswer: 0),
       Question(
           question: "Do you feel extra soreness after runs?",
           answers: ["Yes", "No", "", ""],
           correctAnswer: 0),
       Question(
           question: "Are there tears in your shoes?",
           answers: ["Yes", "No", "", ""],
           correctAnswer: 0),
       Question(
           question: "Do you feel more impact than usual in every step when running",
           answers: ["Yes", "No", "", ""],
           correctAnswer: 0),
   ]
   
   var currentQuestion: Question?
   var currentQuestionPos = 0
   
   var noCorrect = 0
