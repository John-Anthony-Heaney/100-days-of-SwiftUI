import Cocoa

func showWelcome() {
    print("Welcome to my app!")
    print("Be default this prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

func printTimeTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimeTables(number: 5, end: 20)


let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


func sameLetters(first: String, second: String) -> Bool{
    if first.sorted() == second.sorted() {
        return true
    }
    else {
        return false
    }
}

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)

print(c)


func sayHello() {
    return
}




func getUser() -> (firstName: String, lastName: String) {
    ("Taylor","Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")


