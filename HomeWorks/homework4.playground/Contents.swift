import UIKit


/*
 Exercise 1
 Declare myTeam as Girls or Boys.
 Create a Dictionary resultsOfGames where Key contains teamName as String and Value of two [String] results.
 Print the output, for example:
 Girls against Brooklyn Nets scored - 99:89
 Girls against Brooklyn Nets scored - 109:99
 Girls against Dallas Mavericks scored - 87:93
 Girls against Dallas Mavericks scored - 104:97
 Girls against Washington Wizards scored - 117:112
 Girls against Washington Wizards scored - 107:122
 */
/*

 Declaring myTeam.
 */
let myTeam = "Girls"

/*
 Creating dictionary
 */

var resultOfGames: [String: [String]] = [
    "Brooklyn nets": ["99:89", "109:99"],
    "Dallas Maverics": ["87:93", "104:97"],
    "Washington Wizards": ["117:112", "107:122"]
    ]
/*
 Print
 */

for (team, scores) in resultOfGames{
    for score in scores {
        print("\(myTeam) against \(team) scored - \(score)")
    }
}



/*
 Exercise 2
 Declare an Array of Int. In the wallet you have only 1x by 5 - 500 EUR.
 Create a func to calculateCash sum of your cash inside your wallet.
 Run the func.
 */
/* Declaring array of banknotes */

var myWallet = [Int]()

myWallet = [5,10,20,50,100,200,500]

/* Creating function*/

func calculateCash(myWallet: [Int]) -> Int {
    return myWallet.reduce(0,+)
    
}

/* Run the functiion */

let cashSum = calculateCash(myWallet: myWallet)



/*
 Exercise 3
 Create a func isEvenNumber to calculate if a number is odd or even. If the number is even func should return true.
 Run the func.
 */


 func isEvenNumber(_ number: Int) -> Bool {
    return number % 2 == 0
}

let numberToCheck = 9
let isEven = isEvenNumber(numberToCheck)



/*
 Exercise 4
 Create a func createArray to calculate some number from start: to end: than return Int array.
 Declare array and put createArray(from: 1, to: 100)
 print(array)
 */


 func createArray(from start: Int, to end: Int) -> [Int] {
    return Array (start...end)
    
}

var array = createArray(from: 1, to: 100)

 print(array)
 


/*
 Exercise 5
 Create for loop.
 Use array result from Exercise 4.
 Use isEvenNumber from Exercise 3.
 Calculate and remove isEvenNumber using if array.firstIndex of number, inside the if array.remove at index.
 It should be 1/2 of createArray and started from [1,3,5.....
 */


var index = array.count - 1
while index >= 0 {
    if isEvenNumber(array[index]) {
        array.remove(at: index)
    }
    index -= 1
}

print(array)
