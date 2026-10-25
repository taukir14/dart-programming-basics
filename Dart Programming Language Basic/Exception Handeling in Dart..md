# Exception Handling in Dart

## 1. What is Exception Handling?

Exception handling is a way to handle runtime errors in a program without stopping the program unexpectedly.

For example, dividing a number by zero or converting an invalid string into an integer can cause an exception.

Dart provides `try`, `catch`, `on`, `finally`, and `throw` to handle exceptions.

## 2. The `try` and `catch` Blocks

- `try`: Contains code that might cause an exception.
- `catch`: Handles the exception if an error occurs.

### Example

```dart
void main() {
  try {
    int result = int.parse('hello');
    print(result);
  } catch (e) {
    print('An error occurred: $e');
  }

  print('Program continues...');
}
```

**Output:**

```text
An error occurred: FormatException: Invalid radix-10 number ...
Program continues...
```

*Note: The exact error message may vary.*

The program continues running because the exception is handled by `catch`.

## 3. The `on` Keyword

The `on` keyword is used to handle a specific type of exception.

### Example

```dart
void main() {
  try {
    int number = int.parse('abc');
    print(number);
  } on FormatException {
    print('Invalid number format!');
  }
}
```

**Output:**

```text
Invalid number format!
```

Here, `on FormatException` handles errors caused by invalid number formats.

## 4. The `finally` Block

The `finally` block executes whether an exception occurs or not, provided normal control flow reaches it.

### Example

```dart
void main() {
  try {
    print('Inside try block');
    int result = 10 ~/ 2;
    print(result);
  } catch (e) {
    print('An error occurred');
  } finally {
    print('Finally block executed');
  }
}
```

**Output:**

```text
Inside try block
5
Finally block executed
```

The `finally` block is commonly used for cleanup operations.

## 5. Using `throw`

The `throw` keyword is used to create and throw an exception manually.

### Example

```dart
void checkAge(int age) {
  if (age < 18) {
    throw Exception('You must be at least 18 years old.');
  }

  print('Access granted!');
}

void main() {
  try {
    checkAge(16);
  } catch (e) {
    print(e);
  }
}
```

**Output:**

```text
Exception: You must be at least 18 years old.
```

Here, the program throws an exception when the age is less than 18.

## 6. Difference Between `catch` and `on`

| `catch` | `on` |
|---|---|
| Can catch an exception and access its object. | Handles a specified exception type. |
| Can also capture the stack trace. | Can be combined with `catch` to access the exception object. |
| Example: `catch (e)` | Example: `on FormatException` |

### Example Using Both

```dart
void main() {
  try {
    int number = int.parse('abc');
    print(number);
  } on FormatException catch (e) {
    print('Error: $e');
  }
}
```

## 7. Summary

| Keyword | Purpose |
|---|---|
| `try` | Contains potentially risky code. |
| `catch` | Handles an exception. |
| `on` | Handles a specific exception type. |
| `finally` | Executes cleanup code after the `try`/`catch` flow. |
| `throw` | Manually throws an exception. |

## 8. Best Practices

- Use exception handling when an operation may fail.
- Catch specific exceptions when possible.
- Avoid using empty `catch` blocks because they hide errors.
- Display meaningful error messages to users.
- Use `finally` for cleanup tasks when necessary.

**Conclusion:** Exception handling makes Dart programs more reliable by allowing errors to be handled gracefully instead of terminating the program unexpectedly.
