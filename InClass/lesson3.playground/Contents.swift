import Cocoa

//MARK: -Collections

// Array


let arrayOfStrings: [String] = ["a", "b","c","d"]
arrayOfStrings[0]

var arrayOfInt = [Int]()
let arrayOfCharacters: [Character] = ["a", "b","c","d"]

arrayOfInt = [2, 3, 4, 5,]
arrayOfInt = [12, 13, 14, 5]
arrayOfInt += [6, 7, 8, 9]
arrayOfInt.append(10)
arrayOfInt.insert(0, at: 0)
arrayOfInt.count
arrayOfInt[3]

print(arrayOfInt)
dump(arrayOfInt)

type(of: arrayOfInt)

let someArrayInt = [99, 88]

var result = arrayOfInt + someArrayInt
print(result)
dump(result)

!someArrayInt.isEmpty
arrayOfInt.removeFirst()

var fruits = ["mango", "apple", "durian"]
fruits.reverse()


fruits.sorted()

print(fruits)

if !fruits.isEmpty {
    fruits.append("orrange")
    fruits.insert("pear", at: 3)
    fruits.insert(contentsOf:["kivi", "banana"], at: 2)
    
}
print(fruits)

fruits.removeAll { fruit in
    fruit == "kivi"
}

print(fruits)

let searchFruit = fruits.contains {fruit in
    fruit == "pear"
}
print(fruits)

var list: [[Int]] = [ [1,3,5], [0,0,0,], [10,12,13] ]
print(list[2][0])

//Set

var setOfChair = Set<Character>()

var setOfInt: Set<Int> = []

setOfInt = [1,2,1,1,1,4,5,6,7]

//setOfInt = [11]
setOfInt.insert(22)
setOfInt.remove(5)
setOfInt.contains(22)
print(setOfInt)
let someArrayRessult = setOfInt.sorted()
print("someArrayResult:::", someArrayRessult)

type(of: someArrayRessult)

//Dictioaries

var someStringDict = Dictionary<String, String>()
var moreStringDict = [Int:String]()
var stringDict: [String: String] = [:]

var student: [String: String] = [
    "customerEmail" : "m@m.lv",
    "customerName" : "AA",
    "customerSurname" : "BB",
    "customerDOB" : "12/12/1998",
    "website" : "www"
]
student["customerName"]
student["customerName"] = "wwwwwww"


student.updateValue("www.acc.com", forKey: "website")
student.removeValue(forKey: "customerSurname")
student["website"] = nil
dump(student)

var fruitsList: [String: [String]] = [
    "A" : ["Apple","Apricot"],
    "B" : ["Banana", "Bluebery"]
]

fruitsList["A"]

//for Loop

print("1 x 10 is \(1 * 10)")
print("1 x 10 is \(2 * 10)")
print("1 x 10 is \(3 * 10)")
print("1 x 10 is \(4 * 10)")
print("1 x 10 is \(5 * 10)")

for i in 1...5{
    print("\(i) * 10 is \(i * 10)")
}
for _ in 1...5 {
    print("Hello!!!")
}
for index in 1...5 {print("\(index) Hello!!!")
}
let apples = [
"red aplles",
"green aplles",
"green aplles",
"red aplles",
"red aplles",
]
var basket = 0

for apple in apples {
    if apple == "red apples" {
        basket += 1
    }
}
print("I have \(basket) red apples in my basket")

let numberOfLegs = [
    "spiders" : 8,
    "dog" : 4,
    "ant" : 6
]

for (animalName, legsCount) in numberOfLegs {
    print("\(animalName)'s has \(legsCount)")
}

var counter = 0

while true {
    counter += 1
    
print("My counter is \(counter)")
    if counter == 16 {
        print("break")
        break
    }
}

