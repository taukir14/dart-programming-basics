
import 'dart:async';

// ==================================================
// 1. NORMAL FUNCTION
// A function that performs a task without returning a value
// ==================================================

void sayHello() {
  print("Hello, Dart!");
}

// ==================================================
// 2. PARAMETERIZED FUNCTION
// Accepts input through parameters
// ==================================================

void greet(String name) {
  print("Hello, $name!");
}

// ==================================================
// 3. FUNCTION WITH RETURN VALUE
// Returns a value using the return keyword
// ==================================================

int add(int a, int b) {
  return a + b;
}

// ==================================================
// 4. OPTIONAL POSITIONAL PARAMETERS
// Parameters inside [] are optional
// ==================================================

void showInfo(String name, [int? age]) {
  print("Name: $name");

  if (age != null) {
    print("Age: $age");
  } else {
    print("Age not provided");
  }
}

// ==================================================
// 5. OPTIONAL POSITIONAL PARAMETER WITH DEFAULT VALUE
// Uses a default value when the argument is omitted
// ==================================================

void welcome(String name, [String message = "Welcome"]) {
  print("$message, $name!");
}

// ==================================================
// 6. NAMED PARAMETERS
// Arguments are passed using parameter names
// required makes a named parameter mandatory
// ==================================================

void createProfile({
  required String name,
  required int age,
}) {
  print("Name: $name");
  print("Age: $age");
}

// ==================================================
// 7. NAMED PARAMETERS WITH DEFAULT VALUES
// Default values are used if arguments are omitted
// ==================================================

void showSettings({
  String theme = "Light",
  int fontSize = 16,
}) {
  print("Theme: $theme");
  print("Font size: $fontSize");
}

// ==================================================
// 8. ARROW FUNCTION
// Uses => for a short expression
// ==================================================

int square(int number) => number * number;

// ==================================================
// 9. ANONYMOUS FUNCTION
// A function without a name
// ==================================================

void demonstrateAnonymousFunction() {
  List<int> numbers = [1, 2, 3];

  numbers.forEach((number) {
    // This anonymous function runs for each number
    print("Number: $number");
  });
}

// ==================================================
// 10. FUNCTION STORED IN A VARIABLE
// A function can be assigned to a variable
// ==================================================

void demonstrateFunctionVariable() {
  int Function(int, int) operation = (a, b) => a + b;

  print("Function variable result: ${operation(10, 20)}");
}

// ==================================================
// 11. HIGHER-ORDER FUNCTION
// Accepts another function as an argument
// ==================================================

int calculate(
  int a,
  int b,
  int Function(int, int) operation,
) {
  return operation(a, b);
}

// ==================================================
// 12. RECURSIVE FUNCTION
// Calls itself until the base case is reached
// ==================================================

int factorial(int n) {
  // Base case prevents infinite recursion
  if (n <= 1) {
    return 1;
  }

  return n * factorial(n - 1);
}

// ==================================================
// 13. ASYNCHRONOUS FUNCTION
// Future represents a result available later
// async and await help handle asynchronous operations
// ==================================================

Future<String> getData() async {
  // Simulate a delay, like waiting for an API response
  await Future.delayed(Duration(seconds: 1));

  return "Data loaded successfully";
}

// ==================================================
// 14. SYNCHRONOUS GENERATOR FUNCTION
// sync* and yield produce values one at a time
// ==================================================

Iterable<int> generateNumbers() sync* {
  yield 1;
  yield 2;
  yield 3;
}

// ==================================================
// 15. ASYNCHRONOUS GENERATOR FUNCTION
// async* produces values through a Stream
// ==================================================

Stream<int> generateAsyncNumbers() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i;
  }
}

// ==================================================
// MAIN FUNCTION
// Program execution starts here
// ==================================================

Future<void> main() async {
  print("\n===== 1. NORMAL FUNCTION =====");
  sayHello();

  print("\n===== 2. PARAMETERIZED FUNCTION =====");
  greet("Taukir");

  print("\n===== 3. RETURN FUNCTION =====");
  int result = add(10, 20);
  print("Sum: $result");

  print("\n===== 4. OPTIONAL POSITIONAL =====");
  showInfo("Taukir");
  showInfo("Rahim", 22);

  print("\n===== 5. DEFAULT POSITIONAL VALUE =====");
  welcome("Taukir");
  welcome("Rahim", "Good morning");

  print("\n===== 6. NAMED PARAMETERS =====");
  createProfile(name: "Taukir", age: 21);

  print("\n===== 7. NAMED DEFAULT VALUES =====");
  showSettings();
  showSettings(theme: "Dark", fontSize: 20);

  print("\n===== 8. ARROW FUNCTION =====");
  print("Square: ${square(5)}");

  print("\n===== 9. ANONYMOUS FUNCTION =====");
  demonstrateAnonymousFunction();

  print("\n===== 10. FUNCTION VARIABLE =====");
  demonstrateFunctionVariable();

  print("\n===== 11. HIGHER-ORDER FUNCTION =====");
  print("Addition: ${calculate(5, 3, (a, b) => a + b)}");
  print("Multiplication: ${calculate(5, 3, (a, b) => a * b)}");

  print("\n===== 12. RECURSIVE FUNCTION =====");
  print("Factorial of 5: ${factorial(5)}");

  print("\n===== 13. ASYNC FUNCTION =====");
  print("Loading...");
  String data = await getData();
  print(data);

  print("\n===== 14. SYNC GENERATOR =====");
  for (int number in generateNumbers()) {
    print(number);
  }

  print("\n===== 15. ASYNC GENERATOR =====");
  await for (int number in generateAsyncNumbers()) {
    print("Async number: $number");
  }

  print("\n===== ALL EXAMPLES COMPLETED =====");
}
