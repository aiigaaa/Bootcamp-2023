import UIKit

/*
 Exercise 1.1
 
 Create a func calculateResult with argument firstNumber, parametrs numberOne, data type Int, + argument andSecondNumber, parametrs numberTwo, data type Int ,+ argument withCalculationType, parametrs calculationType, data type CalculationType and everything will return Int.
 
 Than use switch case to calculate and return Int result

    var result = numberOne
       
       switch calculationType {
       case .addition: result += numberTwo
        .....
       }
  print("Result:  \(calculationType.rawValue) \(numberOne) and \(numberTwo) = \(result)")
 
    return result
 
 */
enum CalculationType {
    case addition
    case subtraction
    case multiplication
    case division
}

func calculateResult(firstNumber numberOne: Int, secondNumber numberTwo: Int, withCalculationType calculationType: CalculationType) -> Int {
    
    var result = numberOne
    
    switch calculationType {
    case .addition: result += numberTwo
    case .subtraction: result -= numberTwo
    case .multiplication: result *= numberTwo
    case .division:
        if numberTwo != 0 {
            result /= numberTwo}
        else {
            print("Division by zero is not allowed!")
            return 0
        }
    }
    print ("Result:  \(calculationType) \(numberOne) and \(numberTwo) = \(result)")
    return result
}



/*
Exercise 1.2
Declare two numbers.
Call func 4 times for all calculateResult
*/

let numberOne = 10
let numberTwo = 2
let additionResult = calculateResult(firstNumber: numberOne, secondNumber: numberTwo, withCalculationType: .addition)
let subtractionnResult = calculateResult(firstNumber: numberOne, secondNumber: numberTwo, withCalculationType: .subtraction)
let multiplicationResult = calculateResult(firstNumber: numberOne, secondNumber: numberTwo, withCalculationType: .multiplication)
let divisionResult = calculateResult(firstNumber: numberOne, secondNumber: numberTwo, withCalculationType: .division)


/*
Exercise 2

Create struct Car with elements
    name: String
    productionYear: Int
    horsPower: Int

 Create func getSpecs() print it with elements provided above
 */

struct Car {
    var name: String?
    var productionYear: Int?
    var horsePower: Int?
    
    func getSpecs() {
        print ("The \(name ?? "") was released in \(productionYear ?? 0) and it has \(horsePower ?? 0)-hp.")
    }
}

var carOne = Car(name: "BMW iX", productionYear: 2022, horsePower: 500)
var carTwo = Car(name: "Volvo XC60", productionYear: 2023, horsePower: 455)

carOne.getSpecs()
carTwo.getSpecs()
