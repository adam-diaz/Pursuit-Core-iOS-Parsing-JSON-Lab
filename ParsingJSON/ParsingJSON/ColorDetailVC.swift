//
//  ColorDetailVC.swift
//  ParsingJSON
//
//  Created by Adam Diaz on 12/4/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import UIKit

class ColorDetailVC: UIViewController {

    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    
    var color: ColorData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func update() {
        guard let colors = color else {
            fatalError("couldnt find colors")
        }
        
        var hexStr = colors.hexString
          hexStr.removeFirst()
          hexLabel.text = "Hex: \(hexStr)"
          rgbLabel.text = "Red: \(colors.rgb["r"] ?? 0), Green: \(colors.rgb["g"] ?? 0), Blue: \(colors.rgb["b"] ?? 0)"
    }
}
