import Foundation

public protocol Executable {
    func execute()
}

public class Process: Executable {
    
    private var processes = [Process]()
    let work: () -> Void
    
    public init(work: @escaping () -> Void) {
        self.work = work
    }
    
    public func add(_ p: Process) {
        processes.append(p)
    }
    
    public func remove(_ p: Process) {
        processes.append(p)
    }
    
    public func execute() {
        work()
        for p in processes {
            p.execute()
        }
    }
}


public class SingleProcess: Executable {
    
    let work: () -> Void
    
    public init(work: @escaping () -> Void) {
        self.work = work
    }
    
    public func execute() {
        work()
    }
}
