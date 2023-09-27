//
//  ViewController.swift
//  Landmarks Quiz
//
//  Created by Muhamed Alkhatib on 18/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    var quiz = Quiz()
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var landmarkImageView: UIImageView!
    
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var answerResultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeLayout()
        quizFunctionality()
    }
    
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        print("play again pressed")
        quiz.resetGame()
        answerResultImageView.image = nil
        quizFunctionality()
        
        
    }
    
    @IBAction func answerSelectedButton(_ sender: UIButton) {
        if quiz.checkAnswer(answer: sender.currentTitle ?? "No Data") {
            answerResultImageView.image = UIImage(named: "true")
            
        } else {
            answerResultImageView.image = UIImage(named: "false")
        }
        
        quiz.displayNextQuestion()
        quizFunctionality()
    }
    
    func customizeLayout() {
        landmarkImageView.layer.cornerRadius = 4
        landmarkImageView.contentMode = .scaleToFill
        answer1.layer.cornerRadius = 4
        answer2.layer.cornerRadius = 4
        answer3.layer.cornerRadius = 4
        answer4.layer.cornerRadius = 4
        playAgain.tintColor = .white
        playAgain.backgroundColor = .systemBlue
        playAgain.layer.cornerRadius = 4
        playAgain.setAttributedTitle(NSAttributedString(string: "Play Again", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20, weight: .semibold)]), for: .normal)
        answerResultImageView.image = nil
        
        
    }
    
    func quizFunctionality() {
        let currentQuestion = quiz.currentChoicesArr
        let currentChoices = quiz.choices[currentQuestion].shuffled()
        let currentImage = quiz.images[currentQuestion]
        let currentScore = quiz.score
        
        answer1.setTitle(currentChoices[0], for: .normal)
        answer2.setTitle(currentChoices[1], for: .normal)
        answer3.setTitle(currentChoices[2], for: .normal)
        answer4.setTitle(currentChoices[3], for: .normal)
        landmarkImageView.image = currentImage
        scoreLabel.text = "Score \(currentScore)"
        
    }
    
}


