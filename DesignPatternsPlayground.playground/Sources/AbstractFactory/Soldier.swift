//
//  File.swift
//  
//
//  Created by Sha Yan on 4/30/1401 AP.
//

import Foundation

public protocol Soldier: MilitaryUnit {
    var equiqments: [String]  { get }
    func attack()
    func retreat()
}

public struct Conscript: Soldier {
    public let name: String = "Conscript"
    public var equiqments: [String] {
        return ["AK74, Vodka"]
    }
    public func attack() {
        print("FOR MOTHER RUSSIA [Opens Fire ...]")
    }
    
    public func retreat() {
        print("DA Comrade!")
    }
}

public struct GISoldier: Soldier {
    public let name: String = "G.I Soldier"
    public var equiqments: [String] {
        ["M4, Anti-Tank RPG, Rambo Knife"]
    }
    public func attack() {
        print("HOORA [Opens Fire ...]")
    }
    
    public func retreat() {
        print("Alright Commander")
    }
}
