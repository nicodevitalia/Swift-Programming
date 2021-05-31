//
//  TheBasics.swift
//  Swift Programming Language - Tutorial
//
//  Created by Nicolò Curioni on 14/05/21.
//

/*:
 
# The Basics
 
*/


/*:
## Constants and Variables
*/

/*:
### Declaring Constants and Variables
*/

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0


// Multiple constants or variables on a single line
var x = 0.0, y = 0.0, z = 0.0

/*:
 
### Type Annotations
 
*/

var welcomeMessage: String

welcomeMessage = "Hello"

// Define multiple related variables of the same type on a single line,
// separated by commas, with a single type annotation after the final variable name

var red, green, blue: Double

/*:
 
### Naming Constants and Variables
 
*/

// Constant and variable names can contain almost any character,
// including Unicode characterss
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// Change the value of an existing variable to another value of a compatible type.

var friendlyWelcome = "Hello!"

friendlyWelcome = "Bonjour!"

let languageName = "Swift"

// languageName = "Swift++"

// This is a compile-time error: languageName cannot be changed.

// friendlyWelcome is now "Bonjour!"

/*:
 
### Printing Constants and Variables
 
*/

print(friendlyWelcome)

/*:
 
## String Interpolation
 
*/

print("The current value of friendlyWelcome is \(friendlyWelcome)")

/*:
 
## Comments
 
*/

// This is a comment

/* This is also another comment
but is written
over multiple lines. */

/// Semicolons

// Unlike many other languages, Swift doesn't require you to write a semicolon (;) after each statements but, you can use semicolons to add if you want to write multiple separate statements on a single line.

let dog = "🐶"; print(dog)

/*:
 
## Integers
 
*/

/*:
 
### Integer Bounds
 
*/

let minValue = UInt8.min // 0
let maxValue = UInt8.max // 255

/// Type Safety and Type Inference

let meaningOfLife = 42
// meaningOfLife is infered to be of type Int

let pi = 3.14159
// pi is inferred to be of tyoe Double

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

//print(anotherPi)

/*:
 
## Numeric Literals
 
*/

// Integer literals can be written as:

/*
 
 - A decimal number, with no prefix
 - A binary number, with a 0b prefix
 - A octal number, with a 0o prefix
 - A hexadecimal number, with a 0x prefix
 
 */

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

// Numebers with exponent

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// Extra formatting for the numeric literals

let paddedDouble = 00123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000_000_1

/*:
 
## Numeric Type Conversion
 
*/

/*:
 
### Integer Conversion
 
*/

//let cannotBeNegative: UInt8 = -1 // Uncomment to see...

// UInt8 can't store negative numbers, and so this will report an error.

//let tooBig: Int8 = Int8.max + 1 // Uncomment to see...

// Int8 can't store a number larger than its maximum value,
// and so this will also report an error.

// Convert specific number type to another, you initialize a new number of the desired type with the existing value.

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

/*:
 
### Integer and Floating-Point Conversion
 
*/

let three = 3
let pointOneFourFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourFiveNine
// pi2 equals 3.14159, and is inferred to be of type Double

// Floating-point to integer conversion must also be made explicit. An integer can be initialized with a Double of Float value:

let integerPi = Int(pi2)

/*:
 
## Type Aliases
 
*/

// Type alisases define an alternative name for an existing type.

typealias AudioSample = UInt16

// Once you define a type alias, you can use the alias anywhere you might use the original name:

var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0

/*:
 
## Booleans
 
*/

// Swift has a basic Boolean type, called Bool.
// Boolean values are referred to as logical, because they can only ever be true or false.

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    
    print("Mmm, tasty turnips!")
    
} else {
    
    print("Eww, turnips are horrible.")
}

// Prints "Eww, turnips are horrible."

// Swift's type safety prevents non-Boolean values from being substituted for Bool.

let i = 1

//if i {
//    // This example will not compile, and will report an error
//
//}

if i == 1 {
    
    // This example will compile successfully
}

/*:
 
## Optionals
 
*/

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

// convertedNumber is inferred to be of type "Int?", or "optional Int"

var serverResponseCode: Int? = 404
// serverResponse contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

var surveyAcnswer: String?
// surveyAcnswer is automarically set to nil

// If statements and Force Unwrapping

if convertedNumber != nil {
    
    print("convertedNumber contains some integer value.")
}

// Prints print("convertedNumber contains some integer value.")

/*:
 
### Optional Binding
 
*/

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber).")
    
} else {
    
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer.")
}

/*:
 
## Error Handing
 
*/

func makeASandwich() throws {
    
}

var ingredients = ["Bread", "Tomato"]

enum SandwitchError: Error {
    case outOfCleanDishes
    case missingIngredients(_ ingredients: [String])
}

func eatSandwich() {  }
func washDishes() {  }
func buyGroceries(_ ingredients: [String]) {  }

do {
    
    try makeASandwich()
   
    eatSandwich()
    
} catch SandwitchError.outOfCleanDishes {
    
    washDishes()
    
} catch SandwitchError.missingIngredients(let ingredients) {
    
    buyGroceries(ingredients)
}

/*:
 
## Asserts and Preconditions
 
*/

///

let age = -3
//assert(age >= 0, "A person's age can't be less than zero.") // Uncomment this line...
// This assertion fails beacuse -3 isn't >= 0.

// Assertion Failure

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
//    assertionFailure("A person's age can't be lass than zero.")
}

/*:
 
### Enforcing Preconditions
 
*/

// In the implementation of a subscript...

var index = -2

//precondition(index > 0, "Index must be greater than zero.")




