import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser

greetCopy()


let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}



func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

print(sayHello("Taylor"))

let team = ["Gloria", "Suzanne","Piper","Tiffany","Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}


//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)


let captainFirstTeam = team.sorted(by: {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
})

print(captainFirstTeam)


let reverseTeam = team.sorted {return $0 > $1}

let tOnly = team.filter {$0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased()}
print(uppercaseTeam)

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void){
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


let luckyNumbers = [7,4,38,21,16,15,12,33,31,49]



let evenOnly = luckyNumbers.filter {!$0.isMultiple(of: 2)}
let sortedLN = evenOnly.sorted()
print(sortedLN)

let isLucky = { (number: Int) -> String in
    "\(number) is a lucky number"
}


func onePerLine (array: [Int], stringMapper: (Int) -> String){
    for i in 1..<array.count{
        print(stringMapper(array[i]))
    }
}

onePerLine(array: sortedLN, stringMapper: isLucky)

