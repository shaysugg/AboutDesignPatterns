import Foundation

public struct CandidateForHire {
    public let yearsOfExperience: Int
    public let techicalSkills: HiringValue
    public let generalSkills: HiringValue
    public let commiunicationSkills: HiringValue
    public let matchWithCompanyCulture: HiringValue
    public let sallary: Int
    
    public init(yearsOfExperience: Int, techicalSkills: HiringValue, generalSkills: HiringValue, commiunicationSkills: HiringValue, matchWithCompanyCulture: HiringValue, sallary: Int) {
        self.yearsOfExperience = yearsOfExperience
        self.techicalSkills = techicalSkills
        self.generalSkills = generalSkills
        self.commiunicationSkills = commiunicationSkills
        self.matchWithCompanyCulture = matchWithCompanyCulture
        self.sallary = sallary
    }
}
