//
//  City.swift
//  CustomAirbnb
//
//  Created by Uri on 2/2/24.
//

import Foundation

struct City: Identifiable {
    let id = UUID()
    let name: String
    // let hoods: [String]
    // let coverPicture
}

#if DEBUG
extension City {
    static var stub: [City] {
        [
            City(name: "Amsterdam"),
            City(name: "Barcelona"),
            City(name: "London"),
            City(name: "Los Angeles"),
            City(name: "Melbourne"),
            City(name: "Paris"),
            City(name: "Roma"),
            City(name: "San Diego"),
            City(name: "Toronto")
        ]
    }
}
#endif
