import Foundation

public protocol Messenger {
    func sendVerificationCode()
    func sendMarketingMessage()
    func sendAlertMessage()
}

public struct EmailMessenger: Messenger {
    
    private let email: String
    
    public init(email: String) {
        self.email = email
    }
    
    public func sendVerificationCode() {
        print("✉️ VerificationCode sent to \(email)")
    }
    
    public func sendMarketingMessage() {
        print("✉️ Send the marketing message to \(email)")
    }
    
    public func sendAlertMessage() {
        print("✉️ If happened send an alert to \(email)")
    }
    
}


public protocol MessengerDecorator: Messenger {
    var messenger: Messenger { get }
}


public struct PushNotificationMessenger: MessengerDecorator {
    public let messenger: Messenger
    let userName: String
    
    public init(messenger: Messenger, userName: String) {
        self.messenger = messenger
        self.userName = userName
    }
    
    public func sendVerificationCode() {
        messenger.sendVerificationCode()
    }
    
    public func sendMarketingMessage() {
        messenger.sendMarketingMessage()
        print("📪 Send Marketing Notification to \(userName)")
    }
    
    public func sendAlertMessage() {
        messenger.sendAlertMessage()
        print("📪 Send Alert Notification to \(userName)")
    }
    
}


public struct SMSMessenger: MessengerDecorator {
    public let messenger: Messenger
    let phoneNumber: String
    
    public init(messenger: Messenger, phoneNumber: String) {
        self.messenger = messenger
        self.phoneNumber = phoneNumber
    }
    
    public func sendVerificationCode() {
        messenger.sendVerificationCode()
        print("📱 Send verification code to \(phoneNumber)")
    }
    
    public func sendMarketingMessage() {
        messenger.sendMarketingMessage()
    }
    
    public func sendAlertMessage() {
        messenger.sendAlertMessage()
        print("📱 Send alert SMS to \(phoneNumber)")
    }
    
}

