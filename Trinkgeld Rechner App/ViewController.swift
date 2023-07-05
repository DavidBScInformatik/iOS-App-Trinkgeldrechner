//
//  ViewController.swift
//  Trinkgeld Rechner App
//
//  Created by Turk on 27.06.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var betragTextField: UITextField!
    @IBOutlet weak var anzahlTextField: UITextField!
    
    @IBOutlet weak var prozentLabel: UILabel!
    @IBOutlet weak var prozentSlider: UISlider!
    
    @IBOutlet weak var trinkgeldLabel: UILabel!
    @IBOutlet weak var gesamtkostenLabel: UILabel!
    @IBOutlet weak var kostenProPersonLabel: UILabel!
    
    var kosten : Double = 0.0
    var trinkgeldPozent : Double = 0.0
    var trinkgeldKosten : Double = 0.0
    var gesamtkosten : Double = 0.0
    var kostenProPerson : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true);
    }
    
    @IBAction func prozentButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "3%" {
            prozentLabel.text = "3 %"
            prozentSlider.value = 3.0
            berechnenDerKosten()
            return
        }
        
        if sender.titleLabel?.text == "5%" {
            prozentLabel.text = "5 %"
            prozentSlider.value = 5.0
            berechnenDerKosten()
            return
        }
        
        if sender.titleLabel?.text == "7%" {
            prozentLabel.text = "7 %"
            prozentSlider.value = 7.0
            berechnenDerKosten()
            return
        }
    }
    
    @IBAction func prozentSliderAction(_ sender: UISlider) {
        let prozentAsString : String = String(format: "%.0f", sender.value)
        prozentLabel.text = prozentAsString + " %"
        berechnenDerKosten()
    }
    
    func berechnenDerKosten() {
        
        if (betragTextField.text!.isEmpty) || anzahlTextField.text!.isEmpty {
            erstelleAnzeige(message: "Bitte alle Felder ausfüllen")
        }else{
            kosten = Double(betragTextField.text!)!
            trinkgeldPozent = Double(prozentSlider.value)
            
            trinkgeldKosten = (kosten * trinkgeldPozent) / 100;
            gesamtkosten = kosten + trinkgeldKosten;
            kostenProPerson = gesamtkosten / Double(anzahlTextField.text!)!
            
            printUIElements()
        }

    }
    
    func printUIElements(){
        let stringTrinkegeld = String(format: "%.2f", trinkgeldKosten);
        let stringGesamtkosten = String(format: "%.2f", gesamtkosten);
        let stringKostenProPerson = String(format: "%.2f", kostenProPerson);
        
        trinkgeldLabel.text = "Trinkgeld: " + stringTrinkegeld + " €"
        gesamtkostenLabel.text = "Gesamtkosten: " + stringGesamtkosten + " €"
        kostenProPersonLabel.text = "Kosten pro Person: " + stringKostenProPerson + " €"
    }
    
    func erstelleAnzeige(message: String){
        let alert = UIAlertController(title: "Fehler", message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Ok", style: .default){ (action) in}
        
        alert.addAction(action1)
        
        self.present(alert, animated: true, completion: nil)
    }
}

