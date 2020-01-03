//
//  RandomData.swift
//  ParsingJSON
//
//  Created by Adam Diaz on 12/5/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation

struct RandomData: Codable {
    let results: [UserData]
}

struct UserData: Codable {
    let name: [String:String]
    let email: String
    let location: Location
    let phone: String
    let dob: DOB
}

struct Location: Codable {
    let city, country, state: String
}

struct DOB: Codable {
    let date: String
    let age: Int
}


extension RandomData {
    static func getData() -> [UserData] {
        var user = [UserData]()
        guard let fileURL = Bundle.main.url(forResource: "random", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(RandomData.self, from: data)
            user = userData.results
        } catch {
            print("failed to load contents \(error)")
        }
        return user
    }
}
