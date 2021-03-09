//
//  ViewController.swift
//  Project2
//
//  Created by Shilpa Joy on 2021-03-08.
//

import UIKit

class ViewController: UIViewController {
    
   
   
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLbl: UILabel!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var gamerounds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor //we can't put a UIColor into the borderColor property because it belongs to a CALayer, which doesn't understand what a UIColor is. So, we add .cgColor to the end of the UIColor to have it automagically converted to a CGColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetGame))
     
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    @objc func resetGame(){
        score = 0
        scoreLbl.text = String(score)
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        
        if gamerounds != 10 {
            countries.shuffle()
            button1.setImage(UIImage(named: countries[0]), for: .normal) //.normal, which means "the standard state of the button."
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            correctAnswer = Int.random(in: 0...2)
            title = countries[correctAnswer].uppercased()
            gamerounds += 1
        }else {
            let ac = UIAlertController(title: "Game ended", message: "Your final score is \(score)" , preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
            present(ac, animated: true)
        }
            
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        
        if (sender.tag == correctAnswer) {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased()) "
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        scoreLbl.text = "Score: \(String(score))"
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

