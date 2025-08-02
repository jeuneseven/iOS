//
//  ViewController.swift
//  GuessTheFlagUIKit
//
//  Created by seven on 2025/8/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    private var scoreLabel = UILabel()
    
    var countries = [String]()
    var score = 0 {
        didSet {
            scoreLabel.text = "Your score is \(score)"
        }
    }
    var correctAnswer = 0
    var questionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scoreLabel.text = "Your score is \(score)"
        scoreLabel.textColor = .systemBlue
        scoreLabel.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: scoreLabel)
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        renderButton(button: button1)
        renderButton(button: button2)
        renderButton(button: button3)
        
        askQuestion(action: nil)
    }
    
    func renderButton(button:UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        questionCount += 1
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
            
            let ac = UIAlertController(title: title, message: "The correct flag is \(correctAnswer + 1) one", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        
        if questionCount == 3 {
            let ac = UIAlertController(title: title, message: "Finish", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            
            questionCount = 0
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
}

