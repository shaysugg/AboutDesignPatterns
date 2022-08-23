import Foundation

public protocol HiringHandler: AnyObject {
    var nextHandler: HiringHandler? { get }
    
    init(with next: HiringHandler?)
    
    func handle(_ candidate: CandidateForHire) throws
}

extension HiringHandler {
    public func handle(candidate: CandidateForHire) throws {
        try nextHandler?.handle(candidate)
    }
}


public class PhoneCallHiringHandler: HiringHandler {
    public let nextHandler: HiringHandler?
    
    public required init(with next: HiringHandler?) {
        nextHandler = next
    }
    
    public func handle(_ candidate: CandidateForHire) throws {
        guard candidate.yearsOfExperience > 2 else {
            throw HiringError.dontHaveMinimumYearsOfExperience
        }
        try nextHandler?.handle(candidate)
    }
    
}

public class OnlineTestHiringHandler: HiringHandler {
    public let nextHandler: HiringHandler?
    
    public required init(with next: HiringHandler?) {
        nextHandler = next
    }
    
    public func handle(_ candidate: CandidateForHire) throws {
        guard candidate.techicalSkills > .bad else { throw HiringError.lowSkills }
        try nextHandler?.handle(candidate)
    }
    
}

public class TechnicalHiringHandler: HiringHandler {
    public let nextHandler: HiringHandler?
    
    public required init(with next: HiringHandler?) {
        nextHandler = next
    }
    
    public func handle(_ candidate: CandidateForHire) throws {
        guard candidate.techicalSkills > .medium && candidate.commiunicationSkills > .bad else { throw HiringError.lowSkills }
        try nextHandler?.handle(candidate)
    }
    
}

public class HRHiringHandler: HiringHandler {
    public let nextHandler: HiringHandler?
    
    public required init(with next: HiringHandler?) {
        nextHandler = next
    }
    
    public func handle(_ candidate: CandidateForHire) throws {
        guard candidate.matchWithCompanyCulture > .medium && candidate.commiunicationSkills > .medium else { throw HiringError.lowSkills }
        try nextHandler?.handle(candidate)
    }
    
}

public class ContractHiringHandler: HiringHandler {
    public let nextHandler: HiringHandler?
    
    public required init(with next: HiringHandler?) {
        nextHandler = next
    }
    
    public func handle(_ candidate: CandidateForHire) throws {
        guard candidate.sallary < 100000 && candidate.commiunicationSkills > .medium else { throw HiringError.highSalary }
        try nextHandler?.handle(candidate)
    }
    
}

