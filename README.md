Calculator
==========

A calculator app written in swift that performs basic arithmetic functions.

<h2> Rough Algorithm Overview </h2>

1. <strong>Create an array that will contain the entered numbers that are to be equated.
  (In this case: operandStack)</strong>

2. <strong>When a number is added and an operation is pressed, </strong>
    
  a. Get the current number

  b. Reset the text field and get the operation requested 
  
  c. Send the current number to the array (operandStack) using the method  - pushOperand()

3. <strong>When another number has been entered and the "=" sign has been pressed,</strong>
  
  a. Get the entered number and add it to the array (operandStack) using pushOperand()

  b. Call the method to perform the operation (performOperation) that takes the type of operation as an argument (i.e "+", "-", "*", "/")
  
  c. In performOperation(), 
  
    Based on the operation sent, the method popOperand() is called as follows:
````
switch operation
        {
            case "+": result = self.popOperand() + self.popOperand()
            case "-": result = self.popOperand() - self.popOperand()
            case "x": result = self.popOperand() * self.popOperand()
            case "/": result = self.popOperand() / self.popOperand()
            default: break
        }
````
  
  d. In popOperand(), 
  The first number in the array (operandStack) is returned and deleted from the operandStack

  <i>That way, we are returned with both the numbers in the operandStack when we performOperation()</i>
  
  e. Finally, the result of the operation is added to the operandStack by calling pushOperand() once again.
    
   <i> This way, the result of the operation is stored and can be used to perform other operations</i>
