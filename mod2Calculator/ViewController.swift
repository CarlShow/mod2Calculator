//
//  ViewController.swift
//  mod2Calculator
//
//  Created by CARL SHOW on 9/7/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var swapper: UISegmentedControl!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var areaSwapper: UISegmentedControl!
    var didSwap = false
    var whichSwtich = [false, false, false]
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let miniText = [NSAttributedString.Key.foregroundColor: UIColor.white]
            swapper.setTitleTextAttributes(miniText, for: .selected)
            textField1.delegate = self
            textField2.delegate = self
        }
        addButton.layer.cornerRadius = 5
        minusButton.layer.cornerRadius = 5
        multButton.layer.cornerRadius = 5
        divButton.layer.cornerRadius = 5
        calculateButton.layer.cornerRadius = 5
        ansLabel.layer.cornerRadius = 8
        calculateButton.isHidden = true
        areaSwapper.isHidden = true
    }
    @IBAction func onSwap(_ sender: Any)
    {
        if didSwap
        {
            didSwap = false
            calculateButton.isHidden = true
            areaSwapper.isHidden = true
            addButton.isHidden = false
            minusButton.isHidden = false
            multButton.isHidden = false
            divButton.isHidden = false
            textField2.isHidden = false
            whichSwtich = [false, false, false]
            textField1.placeholder = "Number 1"
            textField2.placeholder = "Number 2"
        }
        else
        {
            didSwap = true
            calculateButton.isHidden = false
            areaSwapper.isHidden = false
            addButton.isHidden = true
            minusButton.isHidden = true
            multButton.isHidden = true
            divButton.isHidden = true
            textField2.isHidden = false
            onAreaSwap((Any).self)
        }
    }
    @IBAction func onAreaSwap(_ sender: Any)
    {
        textField1.placeholder = "A"
        textField2.placeholder = "B"
        whichSwtich = [false, false, false]
        whichSwtich[areaSwapper.selectedSegmentIndex] = true
//        print(whichSwtich)
        if whichSwtich[0]
        {
            textField2.isHidden = false
        }
        else if whichSwtich[1]
        {
            textField2.isHidden = false
        }
        else
        {
            textField2.resignFirstResponder()
            textField2.isHidden = true
            textField1.placeholder = "Radius"
        }
    }
    @IBAction func add(_ sender: Any)
    {
        whichSwtich[0] = true
        onCalc()
        whichSwtich[0] = false
    }
    @IBAction func sub(_ sender: Any)
    {
        whichSwtich[1] = true
        onCalc()
        whichSwtich[1] = false
    }
    @IBAction func mult(_ sender: Any)
    {
        whichSwtich[2] = true
        onCalc()
        whichSwtich[2] = false
    }
    @IBAction func div(_ sender: Any)
    {
        onCalc()
    }
    
    func onCalc()
    {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        if let var1 = Double(textField1.text!)
        {
            if let var2 = Double(textField2.text!)
            {
                if whichSwtich[0]
                {
                    ansLabel.text = String(var1 + var2)
                }
                else if whichSwtich[1]
                {
                    ansLabel.text = String(var1 - var2)
                }
                else if whichSwtich[2]
                {
                    ansLabel.text = String(var1 * var2)
                }
                else
                {
                    ansLabel.text = String(var1 / var2)
                }
            }
        }
    }
    @IBAction func onFigure(_ sender: Any)
    {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        if whichSwtich[2]
        {
            areaOfCircle()
        }
        else if let var1 = Double(textField1.text!)
        {
            if let var2 = Double(textField2.text!)
            {
                if whichSwtich[0]
                {
                    ansLabel.text = String(var1*var2)
                }
                else
                {
                    ansLabel.text = String((var1*var2)/2)
                }
            }
        }
    }
    func areaOfCircle()
    {
        if let var1 = Double(textField1.text!)
        {
            ansLabel.text = String((var1*var1)*3.14)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        return true
    }

}
