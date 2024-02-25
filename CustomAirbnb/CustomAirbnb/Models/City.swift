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
            City(name: "Melbourne", hoods: ["Albert Park", "Balaclava", "CBD", "Docklands", "Flemington", "Jolimont", "Kensington", "Port Melbourne", "Princess Hill", "Richmond", "St Kilda", "South Yarra"]),
            City(name: "Paris", hoods: ["Bourse", "Élysée", "Gobelins", "Hôtel-de-Ville", "Louvre", "Luxembourg", "Montmartre", "Observatoire", "Opéra", "Panthéon", "Passy", "Reuilly"]),
            City(name: "Rome", hoods: ["Aventino", "Campo de Fiori", "EUR", "Esquilino", "Monti", "Pigneto", "Prati", "San Giovani", "Trastevere", "Trevi", "Testaccio", "Vatican City"]),
            City(name: "San Diego", hoods: ["Balboa Park", "Bankers Hill", "East Village", "Gaslamp Quarter", "Hillcrest", "La Jolla", "Little Italy", "North Park", "Ocean Beach", "Pacific Beach", "Point Loma", "South Park"]),
            City(name: "Toronto", hoods: ["Annex", "Cabbagetown", "Distillery District", "Harbourfront", "Kensington Market", "Leslieville", "Little Italy", "Queen Street West", "Roncesvalles", "Scarborough", "The Beaches", "Yorkville"])
        ]
    }
}
#endif
