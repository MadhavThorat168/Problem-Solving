//
//  main.swift
//  Application8
//
//  Created by Amit Kulkarni on 01/07/26.
//

// protocol
// - similar to interface in Java
// - collection of method signatures (without the implementations)
// terminology
// - in Java: class implements an interface
// - in Swift: class conforms to a protocol

protocol Shape {
    func area()
    func volume()
}


// after :, there must be a super class if any and then the list of protocols if any
class Rectangle: Shape {
    func area() {
        print("area of rectangle")
    }
    
    func volume() {
        print("volume of rectangle")
    }
}

class Square: Shape {
    func area() {
        print("area of square")
    }
    
    func volume() {
        print("volume of square")
    }
}

// create an object of Rectangle
let shapeRectangle: Shape = Rectangle()
shapeRectangle.area()
shapeRectangle.volume()

// create an object of Square
let shapeSquare: Shape = Square()
shapeSquare.area()
shapeSquare.volume()
