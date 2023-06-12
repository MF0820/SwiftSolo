//
//  HollowViewController.swift
//  SwiftApp
//
//  Created by user on 2023/06/12.
//

import UIKit

class HollowViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var outerDiameterTextField: UITextField!
    @IBOutlet weak var innerDiameterTextField: UITextField!
    
    @IBOutlet weak var axialForceLabel: UILabel!
    @IBOutlet weak var bendingForceLabel: UILabel!
    @IBOutlet weak var twistForceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outerDiameterTextField.delegate = self
        innerDiameterTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func calculatorBtnAction(_ sender: Any) {
        guard let doubleOuterDiameter = Double(outerDiameterTextField.text!) else { return }
        guard let doubleInnerDiameter = Double(innerDiameterTextField.text!) else { return }
        axialForceLabel.text = String(axialForceCalculation(outerDiameter: doubleOuterDiameter, innerDiameter: doubleInnerDiameter))
        bendingForceLabel.text = String(bendingForceCalculation(outerDiameter: doubleOuterDiameter, innerDiameter: doubleInnerDiameter))
        twistForceLabel.text = String(twistForceCalculation(outerDiameter: doubleOuterDiameter, innerDiameter: doubleInnerDiameter))
    }
    
    func axialForceCalculation(outerDiameter: Double, innerDiameter: Double) -> String {
        let pi = Double.pi
        let A = pi / 4 * (pow(outerDiameter, 2) - pow(innerDiameter, 2))
        var axialCalcu = 1 / (1 / (A * 0.2058) * 2.6)
        axialCalcu = floor(axialCalcu * 10) / 10
        return axialCalcu.description
    }
    
    func bendingForceCalculation(outerDiameter: Double, innerDiameter: Double) -> String {
        let pi = Double.pi
        let zp = pi / 32 * ((pow(outerDiameter, 4) - pow(innerDiameter, 4)) / outerDiameter)
        var bendingCalcu = 1 / (1 / (zp * 0.2058) * 2)
        bendingCalcu = floor(bendingCalcu * 10) / 10
        print(bendingCalcu)
        return bendingCalcu.description
    }
    
    func twistForceCalculation(outerDiameter: Double, innerDiameter: Double) -> String {
        let pi = Double.pi
        let zp = pi / 16 * ((pow(outerDiameter, 4) - pow(innerDiameter, 4)) / outerDiameter)
        var twistCalcu = 1 / (1 / (zp * 0.2058) * 5.2)
        twistCalcu = floor(twistCalcu * 10) / 10
        print(twistCalcu)
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
