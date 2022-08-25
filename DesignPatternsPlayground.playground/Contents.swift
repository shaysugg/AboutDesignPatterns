import Foundation
import _Concurrency
/// https://refactoring.guru/design-patterns


//let example: Example = AbstractFactoryExample(factory: .alliedFactory)

//let example: Example =
//FactoryMethodExample(
//    card: BankCard(
//        name: "john doe",
//        dateOfBirth: Date(),
//        expireDate: Date()
//    ))


//let example = AdapterExample()

//let example = CompositeExample()

//let example = ChainOfResponsibilityExample()
//let example = VisitorExample(visitor: ExportVisitor())
let example = DecoratorExample()

example.run()

protocol Example {
    func run()
}

//MARK: Examples
struct AbstractFactoryExample: Example {
    
    let factory: MilitaryFactory
    
    func run() {
        let tank = factory.createTank()
        let soldier = factory.createSoldier()
        let airforce = factory.createAirForce()
        
        print("-- Your Units --")
        print([tank, soldier, airforce].map(\.name))
        
        print("-- Soldier Attacking! --")
        soldier.attack()
        
        print("-- Soldier retreating --")
        soldier.retreat()
        
        print("-- Tank attacking --")
        tank.attack()
        
        print("-- Airforce getting ready --")
        airforce.fly()
        
        print("-- Airforce Attacking! --")
        airforce.attack()
    }
}


struct FactoryMethodExample: Example {
    let card: IDCard
    func run() {
        card.physicalCard()
    }
}


struct AdapterExample: Example {
    
    let albumPlayer = AlbumPlayer(songNameLoader: SongNameLoaderAdapter())
    
    func run() {
        print("loading ...")
        Task { await albumPlayer.play() }
    }
}

struct CompositeExample: Example {
    func run() {
        let osProcess = Process {
            print("👋 show the fancy holla")
        }
        
        let loginProcess = Process {
            print("🔒 Authenticating the user ...")
        }
        
        let showAppsProcess = Process {
            print("📱 Nice shiny apps!")
        }
        
        let checkConnectionProcess = Process {
            print("🪩 checking for WIFI ...")
        }
        
        let checkForUpdatesProcess = Process {
            print("⬆️ Checking for updates ...")
        }
        
        let showNotificationProcess = Process {
            print("🔴 No important notifications!")
        }
        
        let checkBluetoothProcess = Process {
            print("💙 Checking for Bluetooth")
        }
        
        let connectToBluetoothDevicesProcess = Process {
            print("🎧 Connect to headphone ...")
        }
        
        let updateWeatherWidgetProcess = Process {
            print("☀️ 32C")
        }
        
        osProcess.add(loginProcess)
        
        loginProcess.add(showAppsProcess)
        loginProcess.add(checkBluetoothProcess)
        loginProcess.add(checkConnectionProcess)
        
        checkBluetoothProcess.add(connectToBluetoothDevicesProcess)
        
        checkConnectionProcess.add(checkForUpdatesProcess)
        checkConnectionProcess.add(showNotificationProcess)
        checkConnectionProcess.add(updateWeatherWidgetProcess)
        
        osProcess.execute()
    }
    
    
}


struct ChainOfResponsibilityExample: Example {
    func run() {
        let hiringProcess =
        PhoneCallHiringHandler(
            with: OnlineTestHiringHandler(
                with: TechnicalHiringHandler(
                    with: HRHiringHandler(
                        with: ContractHiringHandler(
                            with: nil)))))
        
        let candidate = CandidateForHire(
            yearsOfExperience: 1,
            techicalSkills: .good,
            generalSkills: .excellent,
            commiunicationSkills: .excellent,
            matchWithCompanyCulture: .excellent,
            sallary: 50000)
        
        
        do  {
            try hiringProcess.handle(candidate)
            print("This candidate is sutable for the role.")
        } catch let problem {
            print("This candidate is not a good fit for company because of: \(problem).")
        }
        
    }
    
    
}


struct VisitorExample: Example {
    
    let visitor: FileVisitor
    
    func run() {
        let files: [FileVisitable] =  [
            PhotoshopFile(name: "someps", image: Data()),
            WordFile(name: "word", data: "some text that i wrote in my word file", pageCount: 1),
            PDFFile(name: "pdf", data: "pdf data", quality: 0.5)
            
        ]
        
        for file in files {
            file.accept(visitor)
        }
    }
}

struct DecoratorExample: Example {
    func run() {
        var messenger: Messenger {
            let messenger1 = EmailMessenger(email: "johnDoe@email.com")
            
            let messenger2 = PushNotificationMessenger(messenger: messenger1, userName: "@john_doe")
            
            
            let messenger3 = SMSMessenger(messenger: messenger2, phoneNumber: "+1123456")
            
            return messenger3
        }
        
        messenger.sendAlertMessage()
        messenger.sendMarketingMessage()
        messenger.sendVerificationCode()
    }
}
