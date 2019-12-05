//
//  ColorData.swift
//  ParsingJSON
//
//  Created by Adam Diaz on 12/5/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation

struct ColorData: Codable {
    let name: String
    let rgb: [String : Double]
    let hexString: String
}

extension ColorData {
static func getColors() -> [ColorData] {
    var color = [ColorData]()
    guard let fileURL = Bundle.main.url(forResource: "colors_api", withExtension: "json") else {
        fatalError("could not locate json file")
        
    }
    do {
        let data = try Data(contentsOf: fileURL)
        let colorsData = try JSONDecoder().decode([ColorData].self, from: data)
        color = colorsData
    } catch {
        print("failed to load contents")
    }
    return color
}

}
