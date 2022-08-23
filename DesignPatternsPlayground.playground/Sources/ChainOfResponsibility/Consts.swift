import Foundation

public enum HiringError: Error {
    case dontHaveMinimumYearsOfExperience
    case lowSkills
    case highSalary
}



public enum HiringValue: Comparable {
    case bad , medium, good, excellent
}
