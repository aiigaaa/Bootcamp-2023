import Cocoa

var greeting = "Hello, playground"

print(greeting)

greeting = "Hello guys"

print(greeting)

//declaration and initialization ( = )

var swift: String = "Swift version 5.9"
print (swift)

//declaration and initialization ( = )

let java: String = "Java version 9"

//java = "Java version 10.5"

//MARK: -String interpretation

print("My new programming language will be: \(swift)")

var str = "A string"
withUnsafePointer(to: str) {print("\(str) value has memory adress in: \($0)")
                                  }
//MARK: -Types of Primitive Data
let lessonNumber: Int = 1
let myHeigh: Double = 193.5
let myName: String = "AB"
let myweight: Float = 1234567.123456
let isStudent: Bool = false
let myUser = "A"
let myUsername: Character = "A"
let myAge: Int = 37

//Mark: -Casting
let castIntToDouble = Double(myAge) + myHeigh

print(castIntToDouble)

let optionalString: String? = "100"
//let sum = myAge + Int(optionalString)?? -1
//print(sum)


if  let string = optionalString, let myInt = Int(string) {
    print("Int: \(myInt)")
    
}
// MARK: -Tuples

var myNameIs: (String, String) = ("A", "M")

var myBossIs: (String, String, Int) = ("Jake", "Dee", 44)
print("My boss name is \(myBossIs.0) \(myBossIs.1) and he is \(myBossIs.2) years old")


//MARK: -Operators

var a = 10
a = a + 1
a = a - 1
a = a * 1
a = a / 2

var b = 10
b += 1
b /= 2

let e = 9
let f = 4

var g = e % f
print("g is", g)

a == b
a != b
a > b
a < b
a >= b
a <= b


//MARK: -Logical operators

let latestXcodeVersion = false
let latestOSVersion = true

if latestOSVersion {
    if latestXcodeVersion {
    print("My latest version")
}
}

if latestXcodeVersion || latestOSVersion {
    print("latestXcodeVersion", latestXcodeVersion)
    print("latestOSVersion", latestOSVersion)
    print("one of ny version are up to date")
}
