//
//  ViewController.swift
//  Proyect2
//
//  Created by PEDRO MENDEZ on 29/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries  = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        let stackView = UIStackView(arrangedSubviews: [button1, button2, button3])
         stackView.axis = .vertical
         stackView.distribution = .fillEqually
         stackView.spacing = 05
         stackView.translatesAutoresizingMaskIntoConstraints = false

         view.addSubview(stackView)

         NSLayoutConstraint.activate([
             stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             stackView.topAnchor.constraint(equalTo: view.topAnchor),
             stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])

         askQuestion()
     }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
    }

    @IBAction func buttonTaped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title ,
                                   message: "Your score is: \(score)",
                                   preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    
}

