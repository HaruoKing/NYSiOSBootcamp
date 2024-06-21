<h1 align="center">NYSiOSBootcamp</h1>

# Xcode Playground

## Week 3 Homework Assignment

In this playground you will be seeing overloaded functions, enum,  switches, functions, array, classes, closures, protocols, and inheritance.

### Assigment Requirements Completed

* In the assignment for Week 2, part D asked you to write a function that would compute the average of an array of Int. Using that function and the array created in part A, create two overloaded functions of the function average.
* Create an enum called Animal that has at least five animals. Next, make a function called theSoundMadeBy that has a parameter of type Animal. This function should output the sound that the animal makes. For example, if the Animal pass is a cow, the function should output, “A cow goes moooo.” Call the function twice, sending a different Animal each time.
* This question will have you creating multiple functions that will require you to use closures and collections. First, you will do some setup.
    * Create an array of Int called nums with the values of 0 to 100.
    * Create an array of Int? called numsWithNil with the following values: 79, nil, 80, nil, 90, nil, 100, 72
    * Create an array of Int called numsBy2 with values starting at 2 through 100, incrementing by 2.
    * Create an array of Int called numsBy4 with values starting at 2 through 100, incrementing by 4.
    * Create a function called evenNumbersArray that takes a parameter of [Int] (array of Int) and returns [Int]. The array of Int returned should contain all the even numbers in the array passed. Call the function           passing the nums array and print the output.
    * Create a function called sumOfArray that takes a parameter of [Int?] and returns an Int. The function should return the sum of the array values passed that are not nil. Call the function passing the numsWithNil         array, and print out the results.
    * Create a function called commonElementsSet that takes two parameters of [Int] and returns a Set<Int> (set of Int.) The function will return a Set<Int> of the values in both arrays. 
    * Call the function commonElementsSet passing the arrays numsBy2, numsBy4, and print out the results.
* Create a struct called Square that has a stored property called sideLength and a computed property called area. Create an instance of Square and print out the area.
