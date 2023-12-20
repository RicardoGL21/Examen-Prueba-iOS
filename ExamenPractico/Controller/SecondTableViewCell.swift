//
//  SecondTableViewCell.swift
//  ExamenPractico
//
//  Created by Ricardo Garcia on 20/12/23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    var delegate:InfoSelectedTableViewCell? = nil
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorShow: UIView!
    @IBOutlet weak var switchColor: UISwitch!
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var textGender: UILabel!
    @IBOutlet weak var switchGender: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchGenderAction(_ sender: Any) {
        if textGender.text == "Hombre" {
            if switchGender.isOn {
                if delegate?.genderOption[1] == false {
                    delegate?.genderOption[0] = true
                } else {
                    switchGender.isOn = false
                    let alert = UIAlertController(title: "Lo sentimos", message: "Solo puedes escoger una opcion.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default, handler: nil))
                    delegate?.delegate!.present(alert, animated: true, completion: nil)
                }
            } else {
                delegate?.genderOption[0] = false
            }
        } else {
            if switchGender.isOn {
                if delegate?.genderOption[0] == false {
                    delegate?.genderOption[1] = true
                } else {
                    switchGender.isOn = false
                    let alert = UIAlertController(title: "Lo sentimos", message: "Solo puedes escoger una opcion.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default, handler: nil))
                    delegate?.delegate!.present(alert, animated: true, completion: nil)
                }
            } else {
                delegate?.genderOption[1] = false
            }
        }
    }
    
    
}
