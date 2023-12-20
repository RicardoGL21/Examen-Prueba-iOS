//
//  ViewController.swift
//  ExamenPractico
//
//  Created by Ricardo Garcia on 19/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listOptions = ["Cámara","Foto","Nombre Completo","Número telefónico","Sexo","Color Favorito"]
    var listSelected = [false,false,false,false,false,false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "CheckBoxTableViewCell", bundle: nil), forCellReuseIdentifier: "firstViewCell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Por medio del prepare le mandamos el delegate de este Controller para que pueda acceder a los datos de esta clase
        if segue.identifier == "goToNextView" {
            if let nextViewController = segue.destination as? NextViewController {
                nextViewController.delegate = self
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //Verificamos que sea la vista que estamos buscando
        if identifier == "goToNextView" {
            //Checamos si es que el usuario tiene seleccionado por lo menos un boton
            if listSelected.contains(true) {
                 print(identifier)
                 return true
            } else {
                let alert = UIAlertController(title: "Lo sentimos", message: "Para poder continuar debes de seleccionar por lo menos una opcion.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        return false
    }

}


//Extension para tener el Delegate del UITableView
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "firstViewCell", for: indexPath) as? CheckBoxTableViewCell
        
        cell?.textOption.text = listOptions[indexPath.row]
        cell?.delegate = self
        cell?.indexNumber = indexPath.row
        
        return cell!
        
    }
    
}
