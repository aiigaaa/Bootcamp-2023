import Cocoa

var greeting = "Hello, playground"

/*
 Ex1:
 1.1 Declare two variables of type Float and assign each a number with a fractional part - for example, 3.14 or 42.0
 1.2 Declare another variable of type Double and assign it the sum of two variables of type Float
 1.3 Print the result with print ()

 */
var variable1: Float = 2.21
var variable2: Float = 50.3

let sum: Double = Double(variable1) + Double(variable2)

let formated = String(format:"%.2f",sum)
print(formated)

/*
 Ex2:
 2.1 Create a variable numberOne and assign any integer value to it
 
 2.2 Create another integer variable numberTwo and assign it any value less than numberOne
 
 2.3 Set the new integer constant result to the result of dividing numberOne by numberTwo
 
 2.4 Assign the new integer constant remainder the remainder of numberOne divided by numberTwo
 
 2.5 Output to the console the message: "When dividing <...> by <...>, the result is <...>, the remainder is <...>".
 
 */
let numberOne: Int = 5
let numberTwo: Int = 2
let newOne: Int = numberOne / numberTwo
var reminder = numberOne % numberTwo

print("When dividing \(numberOne) by \(numberTwo), the result is \(newOne), the reminnder is \(reminder)." )

/*
 Ex3:
 You need to buy several new MacBook Pro, each cost 1000 EUR.
 If you are buying 5 and more, with discount it will cost you 900 each! If you are buying 10 and more with discount it will cost you 850 each! Create if-else statements to check Conditions of buying in different amount!
 print("new: \(qty) MacBook Pro with the price of: \(price) EUR, will cost you: \(totalSum) Eur")
 */

let costMacbookPro = 1000
let qty = 10
if (qty >= 10){
    let price = 850
    let totalSum = price * qty
    print("new: \(qty) MacBook Pro with the price of: \(price) EUR, will cost you: \(totalSum) Eur")
    
}
else if (qty >= 5) {
    let price = 900
    let totalSum = price * qty
    print("new: \(qty) MacBook Pro with the price of: \(price) EUR, will cost you: \(totalSum) Eur")
}
else if (qty < 5) {
    let price = 1000
    let totalSum = price * qty
    print("new: \(qty) MacBook Pro with the price of: \(price) EUR, will cost you: \(totalSum) Eur")
}
/*
 Ex4:
 Create String userInputAge and put value "33a" and convert to Int to make Fatal error: Unexpectedly found nil while unwrapping an Optional value!
 Fix this Fatal error inside the if-else statements to print whenever this age can be converted to Int or not!
 */

/*
 var userInputAge: String = "33a"
 var age = Int(userInputAge)!
 */

var userInputAge: String = "33a"
 if let age = Int(userInputAge)
{ print("Age is: \(age)") }
else {print("Age Cannot be converted to integer")
}
    
    /*
 Ex5:
 Calculate the number of years, months, days have passed from you birthday to current date.
 print("Total years: \(totalYearsFromBirth) , total months: \(totalMonthFromBirth), total days: \(totalDaysFromBirth) have passed")
 */
import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let birthdate = dateFormatter.date(from: "2000-05-29")!

let currentDate = Date()

let calendar = Calendar.current

let components = calendar.dateComponents([.year, .month, .day], from: birthdate, to: currentDate)

let totalYearsFromBirth = components.year ?? 0
let totalMonthsFromBirth = components.month ?? 0
let totalDaysFromBirth = components.day ?? 0

print("Total years: \(totalYearsFromBirth), total months: \(totalMonthsFromBirth), total days: \(totalDaysFromBirth) have passed")
/*
 Ex6:
 Use Exercise 5 monthOfBirth to calculate in which quarter of the year you were born.
 Use switch case to print("I was born in the ... quarter")
 */
let monthOfBirth = calendar.component(.month, from: birthdate)

var quarter: String

switch monthOfBirth {
case 1...3:
    quarter = "first"
case 4...6:
    quarter = "second"
case 7...9:
    quarter = "third"
case 10...12:
    quarter = "fourth"
default:
        quarter = "unknown"
}
print("I was born in the \(quarter) quarter.")
