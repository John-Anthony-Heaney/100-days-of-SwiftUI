import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who wil sometimes work \(hours) hours a day, but other times will spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()


let novall = Developer(hours: 8)
novall.printSummary()


class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}


class Car:Vehicle{
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let tesla = Car(isElectric: true, isConvertible: false)


class User {
    var username  = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"

print(user1.username)
print(user2.username)


class Users {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit{
        print("User \(id) I'm dead!")
    }
}

var users = [Users]()
for i in 1...3 {
    let user = Users(id:i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")



class UserName {
    var name = "Paul"
}

var user = UserName()
user.name = "Taylor"
user = UserName()
print(user.name)



class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak(call: String){
        print("\(call) \(call) \(call)!!!")
    }
}

class Dog: Animal {
    
    override func speak(call: String){
        print("\(call) \(call) bark \(call)!!!")
    }
}

class Corgi: Dog{}

class Poodle: Dog{}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    override func speak(call: String){
        print("\(call) \(call) meow \(call)!!!")
    }
    
}

class Persian: Cat{}

class Lion: Cat{}


var nala = Lion(isTame: false, legs: 4)

nala.speak(call: "roooara")
