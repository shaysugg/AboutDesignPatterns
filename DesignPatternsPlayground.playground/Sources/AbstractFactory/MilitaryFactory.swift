//
//  File.swift
//  
//
//  Created by Sha Yan on 4/30/1401 AP.
//

import Foundation


public protocol MilitaryFactory {
    func createSoldier() -> Soldier
    func createTank() -> Tank
    func createAirForce() -> AirForce
}

public extension MilitaryFactory where Self == SovietMilitaryFactory {
    static var sovietFactory: MilitaryFactory { Self() }
}

public extension MilitaryFactory where Self == AlliedMilitaryFactory {
    static var alliedFactory: MilitaryFactory { Self() }
}


public struct SovietMilitaryFactory: MilitaryFactory {
    public func createSoldier() -> Soldier {
        Conscript()
    }
    public func createTank() -> Tank {
        RhinoTank()
    }
    public func createAirForce() -> AirForce {
        Kirov()
    }
}

public struct AlliedMilitaryFactory: MilitaryFactory {
    public func createSoldier() -> Soldier {
        GISoldier()
    }
    public func createTank() -> Tank {
        GrizzlyTank()
    }
    public func createAirForce() -> AirForce {
        Harrier()
    }
}
