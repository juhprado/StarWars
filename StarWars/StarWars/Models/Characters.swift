//
//  Characters.swift
//  StarWars
//
//  Created by Juliana Prado on 09/04/24.
//

import Foundation

struct Characters: Codable {
    var next: String?
    var results: [Person]?
    
    private enum CodingKeys: String, CodingKey {
        case next
        case results
    }
}

struct Person: Codable {
    var id = UUID().uuidString
    var name: String?
    var height: String?
    var mass: String?
    var hairColor: String?
    var skinColor: String?
    var eyeColor: String?
    var birthYear: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"

    }
    
    func getName() -> String {
        return name ?? ""
    }
    
    func getHeight() -> String {
        return height ?? ""
    }
    
    func getMass() -> String {
        return mass ?? ""
    }
    
    func getHairColor() -> String {
        return hairColor ?? ""
    }
    
    func getSkinColor() -> String {
        return skinColor ?? ""
    }
    
    func getEyeColor() -> String {
        return eyeColor ?? ""
    }
    
    func getBirthYear() -> String {
        return birthYear ?? ""
    }
}
