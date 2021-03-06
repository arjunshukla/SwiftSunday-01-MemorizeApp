//
//  MemoryViewController.swift
//  Memorize
//
//  Created by Arjun Shukla on 3/24/21.
//

import UIKit

class MemoryViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var item: MemoryItem!
    var blankCounter = 0

    let visibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Trebuchet MS", size: 28)!,
        .foregroundColor: UIColor.black]

    let invisibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Trebuchet MS", size: 28)!,
        .foregroundColor: UIColor.clear,
        .strikethroughStyle: 1,
        .strikethroughColor: UIColor.black]

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "You must provide a memory item before trying to show this view controller")
        showText()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    func showText() {
        let words = item.text.components(separatedBy: " ")
        let output = NSMutableAttributedString()
        let space = NSAttributedString(string: " ", attributes: visibleText)
        
        for(index, word) in words.enumerated() {
            if index < blankCounter {
                let attributedWord = NSAttributedString(string: word, attributes: visibleText)
                output.append(attributedWord)
            } else  {
                var strippedWord = word
                var punctuation: String?
                
                if ".,:'".contains(word.last!) {
                    punctuation = String(strippedWord.removeLast())
                }
                let attributedWord = NSAttributedString(string: strippedWord, attributes: invisibleText)
                output.append(attributedWord)
                
                if let symbol = punctuation {
                    let attributedPunctuation = NSAttributedString(string: symbol, attributes: visibleText)
                    output.append(attributedPunctuation)
                }
            }
            output.append(space)
        }
        
        textView.attributedText = output
    }

    @objc func wordTapped() {
        blankCounter += 1
        showText()
    }

}
