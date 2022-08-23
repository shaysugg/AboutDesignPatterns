//
//  File.swift
//  
//
//  Created by Sha Yan on 4/30/1401 AP.
//

import Foundation

public protocol Tank: MilitaryUnit {
    var speed: Int { get }
    var armor: Int { get }
    func attack()
}

public struct RhinoTank: Tank {
    public let name: String = "Rhino Tank"
    public var speed: Int { 50 }
    public var armor: Int { 300 }
    public func attack() {
        print("We will burry them! [Opens Fire ...]")
    }
}

public struct GrizzlyTank: Tank {
    public let name: String = "Grizzly Tank"
    public var speed: Int { 150 }
    public var armor: Int { 100 }
    public func attack() {
        print("Tank Reporting [Opens Fire ...]")
    }
}
