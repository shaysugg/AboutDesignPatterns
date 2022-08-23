import Foundation

struct Spy {
    private let spyingOn: Person
    
    
    
    func save(person: Person) {
        
    }
    
     func retrieve() -> Person {
        return spyingOn
    }
}

protocol Person {
    var name: String { get }
    var status: String { get }
}

private extension Spy {
    
    struct Celebrity: Person {
        let name: String
        let status: String
        
        private let income: Int
    }
}

