//
//  SolidViewController.swift
//  SwiftApp
//
//  Created by user on 2023/06/12.
//

import UIKit

class SolidViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var axialForceLabel: UILabel!
    @IBOutlet weak var bendingForceLabel: UILabel!
    @IBOutlet weak var twistForceLabel: UILabel!

    @IBOutlet weak var diameterTextField: UITextField!

    @IBOutlet weak var calculationBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diameterTextField.delegate = self

        calculationBtn.layer.cornerRadius = calculationBtn.frame.height / 2
        calculationBtn.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
    
    @IBAction func calculationBtnAction(_ sender: Any) {
        guard let doubleDiameter = Double(diameterTextField.text!) else { return }
        axialForceLabel.text = String(axialForceCalculation(diameter: doubleDiameter))
        bendingForceLabel.text = String(bendingForceCalculation(diameter: doubleDiameter))
        twistForceLabel.text = String(twistForceCalculation(diameter: doubleDiameter))
    }
    
    
    
    func axialForceCalculation(diameter: Double) -> String {
        let pi = Double.pi
        let A = pi / 4 * pow(diameter, 2)
        var axialCalcu = 1 / (1 / (A * 0.2058) * 2.6)
        axialCalcu = floor(axialCalcu * 10) / 10
        return axialCalcu.description
    }
    
    func bendingForceCalculation(diameter: Double) -> String {
        let pi = Double.pi
        let zp = pi / 32 * pow(diameter, 3)
        var bendingCalcu = 1 / (1 / (zp * 0.2058) * 2)
        bendingCalcu = floor(bendingCalcu * 10) / 10
        return bendingCalcu.description
    }
    
    func twistForceCalculation(diameter: Double) -> String {
        let pi = Double.pi
        let zp = pi / 16 * pow(diameter, 3)
        var twistCalcu = 1 / (1 / (zp * 0.2058) * 5.2)
        twistCalcu = floor(twistCalcu * 10) / 10
        return twistCalcu.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
