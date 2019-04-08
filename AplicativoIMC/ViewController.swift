//
//  ViewController.swift
//  AplicativoIMC
//
//  Created by Igor Faria on 02/04/19.
//  Copyright © 2019 Igor Faria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultVW: UIView!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var heighTF: UITextField!
    @IBOutlet weak var calculateBTN: UIButton!
    @IBOutlet weak var resultLB: UILabel!
    @IBOutlet weak var restultIMG: UIImageView!
    
    var imc:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(weightTF.text!), let heigh = Double(heighTF.text!){
            imc =  weight / (heigh*heigh)
            showResults()
        }else{
            print("Digite todos os campos")

        }
       
    }
    
    func showResults(){
        var result:String = ""
        var image:String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobre peso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        print(result)
        resultLB.text = "\(Int(imc)) : \(result)"
        restultIMG.image = UIImage(named:image)
        resultVW.isHidden = false
        view.endEditing(true)
    }
    
}

