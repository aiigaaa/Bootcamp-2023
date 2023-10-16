import UIKit

//MARK: -Functions()

//multiplyTwoNumbers()

func multiplyTwoNumbers() {
    print("result: ", 3 * 3)
}

multiplyTwoNumbers()

func multiplyTwoNumber() -> Int {
    let a = 5
    let b = 2
    return a * b
}

multiplyTwoNumber()


func multiplyTwoNumber(numberOne a: Int, numberTwo b: Int) -> Int {
    return a * b
}

multiplyTwoNumber(numberOne: 2, numberTwo: 12)

func multiplyTwoNumber(a: Int, b: Int) -> Int {
    return a * b
}


multiplyTwoNumber(a: 14, b: 4)


func multiplyTwoNumber(_ numberOne: Int, _ numberTwo: Int) -> Int {
    
    return numberOne * numberTwo
}

multiplyTwoNumber(5, 5)


func multiplyTwoNumber(_ numberOne: Int, muliply numberTwo: Int) -> Int {
    
    return numberOne * numberTwo
}

multiplyTwoNumber(4, muliply: 4)


func averageCalculation(_ numbers: Double...) -> Double {
    var total = 0.0
    for myNumber in numbers {
        total += myNumber
    }
    
    return total / Double(numbers.count)
}

averageCalculation(10,5,10,5,10,5)


let someValue = 5
let someArrayOfNumbers = [7,5,11,2,18,15,3,4]

filterLessThan(value: someValue, numbers: someArrayOfNumbers)

func filterLessThan(value: Int, numbers: [Int]) -> [Int]{
    var filteredNumbers: [Int] = []
    
    for myNumber in numbers {
        if myNumber <= value {
            filteredNumbers.append(myNumber)
        }
    }
    
    return filteredNumbers
}


func calculateDateOfBirth(day: Int, month: Int, year: Int) {
    let currentDate = Date()
    
    var dateComponets = DateComponents()
    dateComponets.day = day
    dateComponets.month = month
    dateComponets.year = year
    
    let userCalendar = Calendar.current
    
    if let calculateDate = userCalendar.date(from: dateComponets) {
        let dayPassed = userCalendar.dateComponents([.day], from: calculateDate, to: currentDate).day
        let monthPassed = userCalendar.dateComponents([.month], from: calculateDate, to: currentDate).month
        let yearPassed = userCalendar.dateComponents([.year], from: calculateDate, to:  currentDate).year
        
        print("\(yearPassed ?? 0) years, \(monthPassed ?? 0) months and \(dayPassed ?? 0) days have passed since my birthday")
    }
}

calculateDateOfBirth(day: 1, month: 5, year: 1986)

