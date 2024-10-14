import Cocoa

struct BankAccount {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "setting.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "hgurowephr")
}




struct Car {
    let model: String
    let numSeats: Int
    var gear: Int
    
    mutating func up() {
        if gear < 6 {gear += 1}
        
        print("Gear is now \(gear)")
        
    }
    
    mutating func down() {
        if gear > 1 {gear -= 1}
        print("Gear is now \(gear)")
        
    }
}

var a4 = Car(model: "Audi", numSeats: 4, gear: 1)

a4.up()
a4.up()
a4.down()
