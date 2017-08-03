//
//  Flashcards.swift
//  Flashcard App
//
//  Created by iD Student on 8/2/17.
//  Copyright © 2017 com.iDtech. All rights reserved.
//

import Foundation
import GameKit

class Flashcard {

    var question : String
    var options : [String]
    var correctAnswer : String

    init ( question: String, options: [String])
    {
      self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
        
        self.options = shuffle(list: options)
    }
}

class CardCollection {
// Single instance of the card collection    
    public static var instance: CardCollection = CardCollection ()
    
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard: Flashcard {
        get { return cards[currentIndex]}
    
    }
    private init() {
     
        cards = [ Flashcard(question: "Are you a student?", options: ["True","False"]),
                  Flashcard(question: "What's the capitol of Washington state?", options:["Olympia", "Tacoma", "Seattle", "Spokane"]),
                  Flashcard(question: "Where is iD Tech's headquarters?", options:["Campbell, CA", "Albequerque, NM", "Beijing, CN"]),
                  Flashcard(question: "Who won Wimbledon in 2017?" , options: ["Roger Federer", "Novak Djokovich", "Pete Sampras"])]
        
        currentIndex = 0;
        cards = shuffle(list: cards)
    }
    
    
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
             cards = shuffle(list:cards)
        }
        currentCard.options = shuffle( list: currentCard.options)    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
func shuffle<T>( list : [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
}
