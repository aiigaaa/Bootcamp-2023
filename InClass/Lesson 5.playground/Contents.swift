import UIKit

//MARK: -OOP

let postTitle = "OOP"
let postText = "my new text"
let postAuthor = "SS"

let postTitle2 = "OOP"
let postText2 = "my new text"
let postAuthor2 = postAuthor

class Post {
    var title = ""
    var text = ""
    var author = ""
}

let firstPost = Post()

firstPost.title = "POTS title"
firstPost.text = "new text"
firstPost.author = "firstPosstAuthor"

let secondPost = Post()
secondPost.title = "2nd POTS title"
secondPost.text = "2nd new text"
secondPost.author = "2nd firstPosstAuthor"

print("\(firstPost.author) has published new title: \(firstPost.title) with text: \(firstPost.author)")

print("\(secondPost.author) has published new title: \(secondPost.title) with text: \(secondPost.author)")

firstPost === secondPost


class Comment {
    var user = ""
    var numberOfLikes = 0

    func addLikes() {
        numberOfLikes += 1
    }
}

let firstComment = Comment()
firstComment.user = "AA"

firstComment.addLikes()
firstComment.addLikes()
firstComment.addLikes()


class Human {
    
    var name = "Undefined"
    var age = 0
    
 init(myname: String, myage: Int){
   self.name = myname
   self.age = myage
   }
    
init() {}
    
}

let person = Human(myname: "TT", myage: 23)
person.age

let person2 = Human()
person.age = 22


//MARK: -Inheritance

class Parent {
    var name: String
    var age: Int
    
    init(myName: String, myAge: Int){
        self.name = myName
        self.age = myAge
    }
    
    func walk() {
        print("I can walk")
    }
    func eat() {
        print("I can eat")
    }
        
    func sleep() {
    print("I can sleep")
        }
    }
    
    let dad = Parent(myName: "Sam", myAge: 33)
    dad.name
    dad.age
    dad.eat()
    
    class Child: Parent{
        
        func feeding () {
            if age <= 2{
                print("need to feed my child")
            } else {
                print("can eat idependently")
            }
        }
        
        func education() {
            if age >= 3{
                print("My child is in the kindergarden")
            } else if age < 3 {
                print("too early for kindergarden")
            } else {
                print("too late for kindergarden")
            }
        }
    }
let littleBoy = Child(myName: "Tom", myAge: 1)
    
    littleBoy.feeding()
    littleBoy.education()

// MARK: -Polymorphism
    
    class Figure {
        func drawFigure() {}
    }
    
    class Circle: Figure {
        override func drawFigure() {
            print("draw Circle Figure")
        }
    }
    
    class Rectangle: Figure {
        override func drawFigure() {
            print("draw Rectangle FIgure")
        }
    }
class Triangle: Figure {
    override func drawFigure() {
        print("draw Triangle FIgure")
    }
}
    
    let circle = Circle()
    let rectangle = Rectangle()
    let triangle = Triangle()
    
    func drawFigure(_ figure: Figure){
        figure.drawFigure()
    }
    
drawFigure(circle)
