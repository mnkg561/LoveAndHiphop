//
//  ComposeCell.swift
//  LoveAndHiphop
//
//  Created by hollywoodno on 5/2/17.
//  Copyright © 2017 Mogulla, Naveen. All rights reserved.
//

import UIKit

// Alerts delegates that user is attempting to send a chat message
protocol ComposeCellDelegate {
  func ComposeCell(composeCell: ComposeCell, didTapSend value: Bool)
}

class ComposeCell: UITableViewCell {
  
  // MARK: Properties
  var delegate: ComposeCellDelegate!
  @IBOutlet weak var composeText: UITextView!
  @IBOutlet weak var cameraButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    composeText.sizeToFit()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  @IBAction func onSend(_ sender: Any) {
    delegate.ComposeCell(composeCell: self, didTapSend: true)
  }
  
}
