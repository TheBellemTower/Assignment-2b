// Created on: October -2018
// Created by: Ethan Bellem
// Created for: ICS3U
// This program does a basic physics problem, using UIKit
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel : UILabel = UILabel()
    let secondsLabel : UILabel = UILabel()
    let secondsTextField : UITextField = UITextField()
    let calculateButton : UIButton = UIButton()
    let G: Float = 9.81
    let heightLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.274509817361832, green: 0.486274510622025, blue: 0.141176477074623, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Enter length and width to calculate area and perimeter "
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        secondsLabel.text = "Enter the amount of time in seconds since the ball was dropped: "
        view.addSubview(secondsLabel)
        secondsLabel.translatesAutoresizingMaskIntoConstraints = false
        secondsLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        secondsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        secondsTextField.borderStyle = UITextBorderStyle.roundedRect
        secondsTextField.placeholder = "    sec"
        view.addSubview(secondsTextField)
        secondsTextField.translatesAutoresizingMaskIntoConstraints = false
        secondsTextField.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        secondsLabel.leadingAnchor.constraint(equalTo: secondsLabel.trailingAnchor, constant: 20 ).isActive = true
        
        
        calculateButton.setTitle("Calcuate", for: UIControlState.normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(calculateHeight), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        calculateButton.topAnchor.constraint(equalTo: secondsTextField.bottomAnchor, constant: 25).isActive = true
        
        //heigtLabel.text = "test"
        view.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    
    @objc func calculateHeight() {
        // calculate and show height of object
        let seconds : Float = Float(secondsTextField.text!)!
        
        let height = 100 - (1/2) * G * pow(seconds, 2)
        if height <= 0 {
            heightLabel.text = " The object has hit the ground"
        } else {
            heightLabel.text = "The height of the object above ground is \(String(format: "%.2f", height)) m"
        }
        
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
