//
//  InfoSelectedTableViewCell.swift
//  ExamenPractico
//
//  Created by Ricardo Garcia on 19/12/23.
//

import UIKit

class InfoSelectedTableViewCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var delegate:NextViewController? = nil
    var genderOption = [false, false]
        
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var cameraImg: UIImageView!

    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var imgLoad: UIImageView!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameView: UIView!
    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var numberView: UIView!
    
    @IBOutlet weak var genderTableView: UITableView!
    @IBOutlet weak var genderView: UIView!
    
    @IBOutlet weak var colotTableView: UITableView!
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgLoad.load(urlString: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickCamera(tapGestureRecognizer:)))
        cameraImg.addGestureRecognizer(tapGestureRecognizer)
        
        numberField.delegate = self
        nameField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func loadTable(option:String) {
        if option == "Color" {
            self.colotTableView.delegate = self
            self.colotTableView.dataSource = self
            self.colotTableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondViewCell")
        } else {
            self.genderTableView.delegate = self
            self.genderTableView.dataSource = self
            self.genderTableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondViewCell")
        }
    }
    
    @IBAction func dateAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        self.labelDate.text = dateFormatter.string(from: self.datePicker.date)
    }
    
    
    @objc
    func clickCamera(tapGestureRecognizer:UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        delegate!.present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }

        // print out the image size as a test
        self.cameraImg.image = image
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameField {
            let allowedCharacter = CharacterSet.letters
                let allowedCharacter1 = CharacterSet.whitespaces
                let characterSet = CharacterSet(charactersIn: string)
                return allowedCharacter.isSuperset(of: characterSet) || allowedCharacter1.isSuperset(of: characterSet)
        } else if textField == numberField {
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
        }
        return true
    }
    
}

extension InfoSelectedTableViewCell : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == colotTableView {
            return 5
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == colotTableView {
            let cell = self.colotTableView.dequeueReusableCell(withIdentifier: "secondViewCell", for: indexPath) as? SecondTableViewCell
            
            cell?.genderView.isHidden = true
            cell?.colorView.isHidden = false
            
            if indexPath.row == 0 {
                cell?.colorLabel.text = "Rojo"
                cell?.colorShow.backgroundColor = .red
            } else if indexPath.row == 1 {
                cell?.colorLabel.text = "Azul"
                cell?.colorShow.backgroundColor = .blue
            } else if indexPath.row == 2 {
                cell?.colorLabel.text = "Cafe"
                cell?.colorShow.backgroundColor = .brown
            } else if indexPath.row == 3 {
                cell?.colorLabel.text = "Verde"
                cell?.colorShow.backgroundColor = .green
            } else if indexPath.row == 4 {
                cell?.colorLabel.text = "Amarillo"
                cell?.colorShow.backgroundColor = .yellow
            }
            
            return cell!
        } else {
            let cell = self.genderTableView.dequeueReusableCell(withIdentifier: "secondViewCell", for: indexPath) as? SecondTableViewCell
            
            cell?.genderView.isHidden = false
            cell?.colorView.isHidden = true
            cell?.delegate = self
            
            if indexPath.row == 0 {
                cell?.textGender.text = "Hombre"
            } else {
                cell?.textGender.text = "Mujer"
            }
            
            return cell!
            
        }
        return UITableViewCell()
    }
    
    
}
