//
//  ViewController.swift
//  Flashcard App
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 com.iDtech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {


    @IBOutlet weak var questionTextView: UITextView!
    
    
    @IBOutlet weak var answerPickerView: UIPickerView!
    
   @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerPickerView.dataSource = self;
        answerPickerView.delegate = self;
        
        setUpCardUI()
           // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpCardUI() {
        questionTextView.text = CardCollection.instance.currentCard.question
        
      questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
    
      answerPickerView.reloadAllComponents()
    }
    
    // Expand and add to view controller
    
    // Pickerview Data Source
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    // Pickerview delegates
    // returns text of option at a given row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row];
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        var alert: UIAlertController
        if CardCollection.instance.checkAnswer(answerPickerView.selectedRow(inComponent: 0)){
        
        //answer is Correct
            alert = UIAlertController(title: "Correct", message: "Correct Answer!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Yay!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)}
        else {
            alert = UIAlertController(title: "Incorrect", message: "Incorrect answer!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Try again!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)}
        
    CardCollection.instance.nextQuestion()
        
        setUpCardUI()
    }
    }
    

