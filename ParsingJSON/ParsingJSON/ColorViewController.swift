//
//  ColorViewController.swift
//  ParsingJSON
//
//  Created by Adam Diaz on 12/4/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colors = [ColorData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData() {
        colors = ColorData.getColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorDetailVC = segue.destination as? ColorDetailVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("unable to segue")
        }
        
        let color = colors[indexPath.row]
        colorDetailVC.color = color
}
    
}

extension ColorViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
          
        
        
        cell.textLabel?.text = color.name
        cell.textLabel?.textColor = .white
        
        return cell
    }
}

extension ColorViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           let color = colors[indexPath.row]
           let dictColors = color.rgb
           let someColors = UIColor(red: CGFloat(dictColors["r"]!)/CGFloat(255),
                                    green: CGFloat(dictColors["g"]!)/CGFloat(255),
                                    blue: CGFloat(dictColors["b"]!)/CGFloat(255),
           alpha: 1)
           
           cell.backgroundColor = someColors
       }
}
