import Foundation

public protocol IDCard {
    var name: String { get }
    var dateOfBirth: Date { get }
    func physicalCard()
    func createIDPriter() -> IDPrinter
}

public extension IDCard {
    func physicalCard() {
        let printer = createIDPriter()
        printer.printName(name)
        printer.printDateOfBirth(dateOfBirth)
    }
}

public struct LibraryCard: IDCard {
    public init(name: String, dateOfBirth: Date) {
        self.name = name
        self.dateOfBirth = dateOfBirth
    }
    
    public let name: String
    public let dateOfBirth: Date
    public func createIDPriter() -> IDPrinter {
        CasualIDPrinter()
    }
    
}

public struct BankCard: IDCard {
    public init(name: String, dateOfBirth: Date, expireDate: Date) {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.expireDate = expireDate
    }
    
    public let name: String
    public let dateOfBirth: Date
    public let expireDate: Date
    public func createIDPriter() -> IDPrinter {
        FormalIDPrinter()
    }
    
}
