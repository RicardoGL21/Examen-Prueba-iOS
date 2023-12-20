//
//  NextViewController.swift
//  ExamenPractico
//
//  Created by Ricardo Garcia on 19/12/23.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate:ViewController? = nil
    var numListSelected:Array? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if delegate != nil {
            
            for (index,selected) in delegate!.listSelected.enumerated() {
                if selected {
                    numListSelected?.append(index)
                }
            }
            
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: "InfoSelectedTableViewCell", bundle: nil), forCellReuseIdentifier: "infoUserCell")
            
        }
        
    }
    
}

extension NextViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "infoUserCell", for: indexPath) as? InfoSelectedTableViewCell
        
        cell?.delegate = self
        
        cell?.cameraView.isHidden = true
        cell?.imgView.isHidden = true
        cell?.nameView.isHidden = true
        cell?.numberView.isHidden = true
        cell?.genderView.isHidden = true
        cell?.colorView.isHidden = true
        cell?.dateView.isHidden = true
        
        if numListSelected!.count > indexPath.section {
            if delegate?.listOptions[numListSelected![indexPath.section] as! Int] == "Cámara" {
                cell?.cameraView.isHidden = false
            } else if delegate?.listOptions[numListSelected![indexPath.section] as! Int] == "Foto" {
                cell?.imgView.isHidden = false
            } else if delegate?.listOptions[numListSelected![indexPath.section] as! Int] == "Nombre Completo" {
                cell?.nameView.isHidden = false
            } else if delegate?.listOptions[numListSelected![indexPath.section] as! Int] == "Número telefónico" {
                cell?.numberView.isHidden = false
            } else if delegate?.listOptions[numListSelected![indexPath.section] as! Int] == "Sexo" {
                cell?.genderView.isHidden = false
                cell?.loadTable(option: "Sexo")
            } else if delegate?.listOptions[numListSelected![indexPath.section] as! Int] == "Color Favorito" {
                cell?.colorView.isHidden = false
                cell?.loadTable(option: "Color")
            }
        } else {
            cell?.dateView.isHidden = false
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(numListSelected!.count)
        print(section)
        if numListSelected!.count > section {
            return delegate?.listOptions[numListSelected![section] as! Int]
        } else {
            return "Fecha"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (delegate?.listSelected.filter({$0 == true}).count)!+1
    }
}
