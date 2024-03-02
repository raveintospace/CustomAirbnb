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
    let hoods: [String]
}

#if DEBUG
extension City {
    static var stub: [City] {
        [
            City(name: "Amsterdam", hoods: ["Amsteldorp", "Bijlmermeer", "De Pijp", "Gaasperdam", "Ijburg", "Jordaan", "MuseumKwartier", "NDSM", "Oostport", "Plantage", "Slotermeer", "Waterwijk"]),
            City(name: "Barcelona", hoods: ["Barceloneta", "Ciutat Vella", "Clot", "Eixample", "Fort Pienc", "Gràcia", "Les Corts", "Montbau", "Poblenou", "Poble-sec", "Sagrada Família", "Sants"]),
            City(name: "London", hoods: ["Barnet", "Brent", "Camden", "Chelsea", "City", "Croydon", "Enfield", "Hackney", "Newham", "Southwark", "Tower Hamlets", "Westminster"]),
            City(name: "Los Angeles", hoods: ["Arts District", "Beverly Hills", "Chinatown", "Civic Center", "Downtown", "Fairfax", "Hollywood", "Koreatown", "Little Tokio", "Los Feliz", "Playa del Rey", "Venice"]),
            City(name: "Madrid", hoods: ["Arganzuela", "Chamberí", "Chueca", "Huertas", "La Latina", "Lavapiés", "Malasaña", "Moncloa", "Retiro", "Salamanca", "Sol", "Tetuán"]),
            City(name: "Paris", hoods: ["Bourse", "Élysée", "Gobelins", "Hôtel-de-Ville", "Louvre", "Luxembourg", "Montmartre", "Observatoire", "Opéra", "Panthéon", "Passy", "Reuilly"]),
            City(name: "Rome", hoods: ["Aventino", "Campo de Fiori", "EUR", "Esquilino", "Monti", "Pigneto", "Prati", "San Giovani", "Trastevere", "Trevi", "Testaccio", "Vatican City"]),
            City(name: "San Diego", hoods: ["Balboa Park", "Bankers Hill", "East Village", "Gaslamp Quarter", "Hillcrest", "La Jolla", "Little Italy", "North Park", "Ocean Beach", "Pacific Beach", "Point Loma", "South Park"]),
            City(name: "Vancouver", hoods: ["Coal Harbour", "Commercial Drive", "Downtown", "East Vancouver", "Gastown", "Granville Island", "Kerrisdale", "Kitsilano", "Mount Pleasant", "Shaughnessy", "West End", "Yaletown"])
        ]
    }
}
#endif
