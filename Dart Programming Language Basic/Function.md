# Dart Functions

A function is a reusable block of code that performs a specific task. Functions help make programs organized, readable, and reusable.

## Table of Contents

1. [Normal Function](#1-normal-function)
2. [Parameterized Function](#2-parameterized-function)
3. [Return Function](#3-function-with-return-value)
4. [Optional Positional Parameters](#4-optional-positional-parameters)
5. [Named Parameters](#5-named-parameters)
6. [Arrow Function](#6-arrow-function)
7. [Anonymous Function](#7-anonymous-function)
8. [Higher-Order Function](#8-higher-order-function)
9. [Recursive Function](#9-recursive-function)
10. [Asynchronous Function](#10-asynchronous-function)
11. [Generator Function](#11-generator-function)

## Function Types Overview

| Function Type | Purpose |
|---|---|
| Normal Function | Performs a general task |
| Parameterized Function | Accepts input through parameters |
| Return Function | Returns a result to the caller |
| Optional Positional | Allows optional positional arguments |
| Named Parameters | Passes arguments using parameter names |
| Arrow Function | Provides concise syntax for a single expression |
| Anonymous Function | Defines a function without a name |
| Higher-Order Function | Accepts or returns another function |
| Recursive Function | Calls itself to solve a problem |
| Asynchronous Function | Handles operations that complete later |
| Generator Function | Produces values one at a time |

---

## 1. Normal Function

A normal function is a function that performs a specific task. The `void` keyword indicates that the function does not return a value.

```dart
void sayHello() {
  // Print a greeting message
  print("Hello, Dart!");
}

void main() {
  // Call the function
  sayHello();
}
```

**Output:**
```text
Hello, Dart!
```

## 2. Parameterized Function

A parameterized function accepts input through parameters. These values can be used inside the function.

```dart
void greet(String name) {
  // Use the name parameter
  print("Hello, $name!");
}

void main() {
  // Pass an argument to the function
  greet("Taukir");
}
```

**Output:**
```text
Hello, Taukir!
```

- **Parameter:** A variable defined in the function declaration.
- **Argument:** The actual value passed when calling the function.

## 3. Function with Return Value

A function can calculate a result and return it using the `return` keyword. The return type specifies the type of value returned.

```dart
int add(int a, int b) {
  // Calculate and return the sum
  return a + b;
}

void main() {
  // Store the returned result
  int result = add(10, 20);

  print(result);
}
```

**Output:**
```text
30
```

## 4. Optional Positional Parameters

Optional positional parameters are defined inside square brackets `[]`. The caller can provide these arguments or leave them out.

```dart
void showInfo(String name, [int? age]) {
  // Display the required name
  print("Name: $name");

  // Check whether age was provided
  if (age != null) {
    print("Age: $age");
  } else {
    print("Age not provided");
  }
}

void main() {
  showInfo("Taukir");
  showInfo("Rahim", 22);
}
```

**Output:**
```text
Name: Taukir
Age not provided
Name: Rahim
Age: 22
```

## 5. Named Parameters

Named parameters are defined inside curly braces `{}`. They allow arguments to be passed using their parameter names, making function calls easier to understand.

The `required` keyword makes a named parameter mandatory.

```dart
void createProfile({
  required String name,
  required int age,
}) {
  // Display profile information
  print("Name: $name");
  print("Age: $age");
}

void main() {
  // Pass arguments using parameter names
  createProfile(name: "Taukir", age: 21);
}
```

**Output:**
```text
Name: Taukir
Age: 21
```

## 6. Arrow Function

An arrow function uses `=>` to represent a single expression. It is useful for writing short functions concisely.

```dart
// Return the square of a number
int square(int number) => number * number;

void main() {
  print(square(5));
}
```

**Output:**
```text
25
```

An arrow function returns the value of its expression automatically. It can also be used with `void` functions when the expression performs an action.

## 7. Anonymous Function

An anonymous function is a function without a name. It is often passed directly as an argument to another function.

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4];

  // Pass an anonymous function to forEach()
  numbers.forEach((number) {
    print(number);
  });
}
```

**Output:**
```text
1
2
3
4
```

## 8. Higher-Order Function

A higher-order function is a function that accepts another function as an argument or returns a function.

```dart
// Accept another function as an argument
int calculate(
  int a,
  int b,
  int Function(int, int) operation,
) {
  return operation(a, b);
}

// Addition operation
int add(int a, int b) => a + b;

// Multiplication operation
int multiply(int a, int b) => a * b;

void main() {
  print(calculate(5, 3, add));
  print(calculate(5, 3, multiply));
}
```

**Output:**
```text
8
15
```

Here, `calculate()` receives different functions and executes them with the given numbers.

## 9. Recursive Function

A recursive function calls itself to solve a problem. It must have a base case to stop the recursive calls.

```dart
int factorial(int n) {
  // Base case: stop recursion
  if (n <= 1) {
    return 1;
  }

  // Call the function with a smaller number
  return n * factorial(n - 1);
}

void main() {
  print(factorial(5));
}
```

**Output:**
```text
120
```

The factorial of 5 is:

`5! = 5 × 4 × 3 × 2 × 1 = 120`

## 10. Asynchronous Function

Asynchronous functions handle operations that may take time, such as network requests, file operations, or database calls.

Dart uses `Future`, `async`, and `await` to work with asynchronous operations.

```dart
Future<String> getData() async {
  // Simulate an operation that takes time
  await Future.delayed(Duration(seconds: 2));

  // Return the result
  return "Data loaded";
}

Future<void> main() async {
  print("Loading...");

  // Wait until getData() completes
  String result = await getData();

  print(result);
}
```

**Output:**
```text
Loading...
Data loaded
```

The message `Data loaded` appears after approximately two seconds.

- `Future<T>` represents a result that will become available later.
- `async` marks a function as asynchronous.
- `await` waits for an asynchronous result without blocking the entire application thread.

## 11. Generator Function

A generator function produces a sequence of values using the `yield` keyword. A synchronous generator uses `sync*` and returns an `Iterable`.

```dart
Iterable<int> generateNumbers() sync* {
  // Produce values one at a time
  yield 1;
  yield 2;
  yield 3;
}

void main() {
  // Iterate through generated values
  for (int number in generateNumbers()) {
    print(number);
  }
}
```

**Output:**
```text
1
2
3
```

Generator functions are useful when values need to be produced sequentially rather than returned as a single result.

Dart also supports asynchronous generators using `async*`, which return a `Stream`.

---

## Key Takeaways

- Use `void` when a function does not return a value.
- Use parameters to pass input into functions.
- Use `return` to send a result back to the caller.
- Use optional positional and named parameters to make functions flexible.
- Use arrow functions for concise expressions.
- Use anonymous and higher-order functions for callback-based programming.
- Use recursion for problems that can be broken into smaller versions of themselves.
- Use `async` and `await` for asynchronous operations.
- Use generator functions when values should be produced one at a time.

**Recommended Learning Order:** Normal Functions → Parameters → Return Values → Optional and Named Parameters → Arrow Functions → Anonymous Functions → Higher-Order Functions → Recursion → Async/Await → Generators.
