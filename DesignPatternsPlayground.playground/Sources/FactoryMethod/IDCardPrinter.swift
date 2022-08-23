import Foundation


public protocol IDPrinter {
    func printName(_ name: String)
    func printDateOfBirth(_ date: Date)
}

struct FormalIDPrinter: IDPrinter {
    func printName(_ name: String) {
        print("NAME: \(name.capitalized)")
    }
    func printDateOfBirth(_ date: Date) {
        let date = date.formatted(date: .numeric, time: .omitted)
        print("DATE OF BIRTH: \(date)")
    }
}

struct CasualIDPrinter: IDPrinter {
    func printName(_ name: String) {
        print("Name: \(name)")
    }
    func printDateOfBirth(_ date: Date) {
        let date = date.formatted(date: .abbreviated, time: .omitted)
        print("Date of birth: \(date)")
    }
}
