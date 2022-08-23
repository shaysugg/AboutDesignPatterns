//
//  File.swift
//  
//
//  Created by Sha Yan on 4/30/1401 AP.
//

import Foundation

public protocol AirForce: MilitaryUnit {
    func fly()
    func attack()
}

public struct Kirov: AirForce {
    public let name: String = "Kirov"
    
    public func fly() {
        print("KIROV reporting ...")
    }
    public func attack() {
        print("Ha Ha Ha [Drops bombs]")
    }
}

public struct Harrier: AirForce {
    public let name: String = "Harrier Air-Force"
    public func fly() {
        print("Air-Force Harrier reporting ...")
    }
    public func attack() {
        print("We've got them on under the radar [Shots missles]")
    }
}
