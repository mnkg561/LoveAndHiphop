//
//  FactQuestionView.swift
//  LoveAndHiphop
//
//  Created by hollywoodno on 5/21/17.
//  Copyright © 2017 Mogulla, Naveen. All rights reserved.
//

import UIKit

protocol FactQuestionViewDelegate {
  func FactViewDidSelectAnswer(factQuestionView: FactQuestionView, button: UIButton, selectedAnswer: Int)
}

//@IBDesignable
class FactQuestionView: UIView, UIScrollViewDelegate {
  
  // MARK: Properties
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  var selectedAnswer: Int?
  var answer: Int?
  var answerButtons: [UIButton]?
  var delegate: FactQuestionViewDelegate?
  
  var questionId: String?
  
  @IBInspectable var question: String? {
    get {
      return questionLabel.text
    }
    
    set {
      questionLabel.text = newValue
    }
  }
  
  @IBInspectable var trueAnswer: String? {
    get {
      return trueButton.titleLabel?.text
    }
    
    set {
      trueButton.setTitle(newValue, for: .normal)
      trueButton.layer.cornerRadius = 5
      trueButton.layer.borderWidth = 1
      trueButton.layer.borderColor = UIColor(red: 49/255, green: 136/255, blue: 170/255, alpha: 1.0).cgColor
    }
  }
  
  @IBInspectable var falseAnswer: String? {
    get {
      return trueButton.titleLabel?.text
    }
    
    set {
      falseButton.setTitle(newValue, for: .normal)
      falseButton.layer.cornerRadius = 5
      falseButton.layer.borderWidth = 1
      falseButton.layer.borderColor = UIColor(red: 49/255, green: 136/255, blue: 170/255, alpha: 1.0).cgColor
    }
  }
  
  var answers: [String]? {
    get {
      return [(trueButton.titleLabel?.text)!, (falseButton.titleLabel?.text)!]
    }
    
    set {
      trueAnswer = newValue?[0]
      falseAnswer = newValue?[1]
    }
  }
  
  // MARK: Methods
  @IBAction func didTapAnswer(_ sender: UIButton) {
    selectedAnswer = sender.tag
    
    // Deselect all other buttons, except selected
    for button in answerButtons! {
      button.backgroundColor = UIColor.clear
    }
    
    sender.backgroundColor = UIColor(red: 49/255, green: 136/255, blue: 170/255, alpha: 1.0)
    
    // Alert delegates
    delegate?.FactViewDidSelectAnswer(factQuestionView: self, button: sender, selectedAnswer: sender.tag)
    
  }
  
  // MARK: Initialization
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    loadNib()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    UIButton.appearance().layer.cornerRadius = 5
    loadNib()
    
  }
  
  func loadNib() {
    
    // Initialize the nib
    let nib = UINib(nibName: "FactQuestionView", bundle: Bundle(for: type(of: self)))
    nib.instantiate(withOwner: self, options: nil)
    
    // Set up custom view.
    contentView.frame = bounds // Fill up superview, with constraints applie
    contentView.clipsToBounds = true
    
    scrollView.frame = contentView.bounds
    scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: scrollView.bounds.height)
    scrollView.clipsToBounds = true

    addSubview(contentView)
    
    // Allows easier control over manipulating button state appearances
    answerButtons = [trueButton, falseButton]

    self.clipsToBounds = true
  }
  
}
