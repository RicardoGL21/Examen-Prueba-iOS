//
//  CheckBoxTableViewCell.swift
//  ExamenPractico
//
//  Created by Ricardo Garcia on 19/12/23.
//

import UIKit

class CheckBoxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textOption: UILabel!
    @IBOutlet weak var switchCheck: UISwitch!
    
    var delegate:ViewController? = nil
    var indexNumber:Int? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func clickSwitch(_ sender: Any) {
        if switchCheck.isOn {
            delegate?.listSelected[indexNumber ?? 0] = true
        } else {
            delegate?.listSelected[indexNumber ?? 0] = false
        }
    }
    
}
