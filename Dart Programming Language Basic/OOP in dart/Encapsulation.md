# Encapsulation in Dart

## 1. What is Encapsulation?

**Encapsulation** is one of the four main principles of Object-Oriented Programming (OOP).

Encapsulation means **wrapping data and the methods that operate on that data into a single unit (class) and controlling access to that data.**

In Dart, encapsulation is commonly implemented using classes, private identifiers, getters, setters, and validation.

### Real-Life Example

Think about a bank account.

- You have a bank balance.
- You can deposit money.
- You can withdraw money.
- You cannot directly change the balance through the bank's public interface.

The bank controls how the balance changes.

This is the basic idea of encapsulation.

---

## 2. Basic Example

In Dart, an identifier beginning with an underscore (`_`) is private to its **library**.

```dart
class BankAccount {
  double _balance = 0;

  void deposit(double amount) {
    _balance += amount;
  }

  void showBalance() {
    print("Balance: $_balance");
  }
}

void main() {
  BankAccount account = BankAccount();

  account.deposit(1000);
  account.showBalance();
}
```

### Output

```text
Balance: 1000.0
```

### Explanation

- `BankAccount` is a class.
- `_balance` is a private field.
- `deposit()` changes the balance through a method.
- `showBalance()` displays the balance.
- The balance is controlled through the class's public methods.

**Important:** Dart privacy is library-based, not class-based. Code in the same library can access `_balance`, but code in a separate library cannot access it directly.

---

## 3. Why Do We Need Encapsulation?

Without encapsulation, data can be changed without proper validation.

### Example Without Encapsulation

```dart
class BankAccount {
  double balance = 1000;
}

void main() {
  BankAccount account = BankAccount();

  account.balance = -5000;

  print(account.balance);
}
```

### Output

```text
-5000.0
```

### Problem

A bank account should not normally have a negative balance simply because someone assigned an arbitrary value.

The public field allows uncontrolled modification.

### Improved Example

```dart
class BankAccount {
  double _balance = 1000;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposit successful");
    } else {
      print("Invalid deposit amount");
    }
  }

  void showBalance() {
    print("Balance: $_balance");
  }
}

void main() {
  BankAccount account = BankAccount();

  account.deposit(500);
  account.deposit(-200);
  account.showBalance();
}
```

### Output

```text
Deposit successful
Invalid deposit amount
Balance: 1500.0
```

Now the class validates the amount before modifying the balance.

---

## 4. Private Variables in Dart

A private identifier begins with an underscore (`_`).

### Example

```dart
class Student {
  String _name = "Taukir";
  int _age = 21;

  void showDetails() {
    print("Name: $_name");
    print("Age: $_age");
  }
}

void main() {
  Student student = Student();

  student.showDetails();

  // print(student._name); // Error from another library
}
```

### Output

```text
Name: Taukir
Age: 21
```

### Explanation

- `_name` is private to its library.
- `_age` is private to its library.
- `showDetails()` provides controlled access to the data.

**Note:** If this code is used in the same Dart library, underscore-prefixed members remain accessible there. For normal multi-file projects, privacy depends on the library boundary.

---

## 5. Getters in Dart

A **getter** allows you to read a value through a property-like interface.

The `get` keyword is used to define a getter.

### Example

```dart
class Student {
  String _name = "Taukir";

  String get name {
    return _name;
  }
}

void main() {
  Student student = Student();

  print(student.name);
}
```

### Output

```text
Taukir
```

### Explanation

- `_name` is the private field.
- `name` is a public getter.
- `student.name` reads the value without calling a method with parentheses.

### Short Getter Syntax

```dart
class Student {
  String _name = "Taukir";

  String get name => _name;
}

void main() {
  Student student = Student();

  print(student.name);
}
```

Both examples produce the same output.

---

## 6. Setters in Dart

A **setter** allows you to update a value while controlling how the value is changed.

The `set` keyword is used to define a setter.

### Example

```dart
class Student {
  String _name = "Unknown";

  String get name => _name;

  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    } else {
      print("Name cannot be empty");
    }
  }
}

void main() {
  Student student = Student();

  student.name = "Taukir";
  print(student.name);

  student.name = "";
  print(student.name);
}
```

### Output

```text
Taukir
Name cannot be empty
Taukir
```

### Explanation

- `get name` returns the current name.
- `set name(String value)` accepts a new name.
- The setter checks whether the value is empty.
- If the value is invalid, the original name remains unchanged.

### Important Difference

| Getter | Setter |
|---|---|
| Reads a value | Updates a value |
| Uses `get` | Uses `set` |
| Has no parameter | Accepts one parameter |
| Called like a property | Assigned like a property |

---

## 7. Encapsulation with Validation

Validation ensures that data follows specific rules before it is accepted.

### Example: Student Marks

```dart
class Student {
  String name;
  double _marks = 0;

  Student(this.name);

  double get marks => _marks;

  set marks(double value) {
    if (value >= 0 && value <= 100) {
      _marks = value;
    } else {
      print("Marks must be between 0 and 100");
    }
  }

  void showDetails() {
    print("Name: $name");
    print("Marks: $_marks");
  }
}

void main() {
  Student student = Student("Taukir");

  student.marks = 85;
  student.showDetails();

  student.marks = 150;
  student.showDetails();
}
```

### Output

```text
Name: Taukir
Marks: 85.0
Marks must be between 0 and 100
Name: Taukir
Marks: 85.0
```

### Explanation

The setter allows marks only between `0` and `100`.

If an invalid value is provided, the existing marks remain unchanged.

This helps protect the object's data from invalid updates.

---

## 8. Encapsulation with Constructors

A constructor can initialize private fields when an object is created.

### Example

```dart
class Employee {
  String _name;
  double _salary;

  Employee(String name, double salary)
      : _name = name,
        _salary = salary > 0 ? salary : 0;

  String get name => _name;
  double get salary => _salary;

  void showDetails() {
    print("Name: $_name");
    print("Salary: $_salary");
  }
}

void main() {
  Employee employee1 = Employee("Rahim", 50000);
  Employee employee2 = Employee("Karim", -10000);

  employee1.showDetails();
  employee2.showDetails();
}
```

### Output

```text
Name: Rahim
Salary: 50000.0
Name: Karim
Salary: 0.0
```

### Explanation

- The constructor initializes private fields.
- The salary is checked before being stored.
- A negative salary is replaced with `0`.
- Public getters allow users to read the values.

This demonstrates how constructors can enforce initial data rules.

---

## 9. Encapsulation Using Methods

You do not always need setters. Sometimes public methods are better because they express a specific action.

### Example: Bank Account

```dart
class BankAccount {
  double _balance;

  BankAccount(this._balance);

  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid deposit");
      return;
    }

    _balance += amount;
    print("Deposit successful");
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdrawal");
    } else if (amount > _balance) {
      print("Insufficient balance");
    } else {
      _balance -= amount;
      print("Withdrawal successful");
    }
  }

  double get balance => _balance;
}

void main() {
  BankAccount account = BankAccount(5000);

  account.deposit(1000);
  account.withdraw(2000);
  account.withdraw(10000);

  print("Final balance: ${account.balance}");
}
```

### Output

```text
Deposit successful
Withdrawal successful
Insufficient balance
Final balance: 4000.0
```

### Explanation

- `_balance` is private.
- `deposit()` validates the deposit amount.
- `withdraw()` prevents invalid withdrawals and overdrafts.
- `balance` provides read-only access to the current balance.

The balance can be changed only through the class's controlled operations from outside its library.

---

## 10. Read-Only Properties

Sometimes users should be able to read a value but not change it directly.

A getter without a public setter can provide read-only access through the public interface.

### Example

```dart
class User {
  String _email;

  User(this._email);

  String get email => _email;
}

void main() {
  User user = User("user@example.com");

  print(user.email);

  // user.email = "new@example.com"; // Error
}
```

### Output

```text
user@example.com
```

### Explanation

- The `email` getter allows reading the value.
- There is no public setter for `email`.
- External code cannot assign a new value using `user.email = ...`.

The field is still private to its library, and code inside that library can access it.

---

## 11. Encapsulation with Computed Getters

A getter can calculate a value instead of returning a stored field.

### Example

```dart
class Rectangle {
  double _length;
  double _width;

  Rectangle(this._length, this._width);

  double get area => _length * _width;

  double get perimeter => 2 * (_length + _width);
}

void main() {
  Rectangle rectangle = Rectangle(10, 5);

  print("Area: ${rectangle.area}");
  print("Perimeter: ${rectangle.perimeter}");
}
```

### Output

```text
Area: 50.0
Perimeter: 30.0
```

### Explanation

- `_length` and `_width` store the dimensions.
- `area` calculates the rectangle's area.
- `perimeter` calculates the perimeter.
- Both getters expose calculated values without allowing direct assignment through those properties.

This keeps the public interface simple.

---

## 12. Advantages of Encapsulation

1. **Data protection:** Prevents uncontrolled access through the public interface.
2. **Validation:** Allows the class to reject invalid values.
3. **Maintainability:** Internal implementation can change without necessarily changing the public API.
4. **Control:** Determines which operations are available to users of the class.
5. **Readability:** Makes the class's intended operations clearer.
6. **Reliability:** Helps preserve valid object state.

## 13. Real-World Applications

Encapsulation is commonly used in:

- Banking systems
- Student management systems
- Employee management systems
- User authentication
- E-commerce applications
- Inventory management
- Flutter application models

For example, a shopping cart can keep its item list private and provide methods such as `addItem()`, `removeItem()`, and `calculateTotal()`.

---

## 14. Common Mistakes

### Mistake 1: Making every field public

```dart
class BankAccount {
  double balance = 1000;
}
```

External code can change the balance to any value.

**Solution:** Use a private field and controlled operations where the data needs protection.

### Mistake 2: Thinking `_variable` is private only to its class

In Dart, underscore-prefixed identifiers are private to their library, not just their class.

### Mistake 3: Confusing getters with methods

```dart
String get name => _name;
```

Use `student.name`, not `student.name()`.

### Mistake 4: Assuming a setter automatically validates data

```dart
set age(int value) {
  _age = value;
}
```

This setter accepts any integer, including negative values.

**Solution:** Add validation inside the setter.

### Mistake 5: Using a setter when an action method is clearer

For bank operations, `deposit()` and `withdraw()` are usually clearer than allowing arbitrary changes through `set balance(...)`.

---

## 15. Practice Tasks

Try solving these exercises yourself.

- [ ] Create a `Student` class with private `_name` and `_marks` fields.
- [ ] Use getters to read the student's name and marks.
- [ ] Use a setter to accept marks only between `0` and `100`.
- [ ] Create a `BankAccount` class with a private `_balance` field.
- [ ] Implement `deposit()` and `withdraw()` methods with validation.
- [ ] Create an `Employee` class with private `_salary` and a validated setter.
- [ ] Create a `Product` class with private `_price` and reject negative prices.
- [ ] Create a `Rectangle` class with private dimensions and computed area and perimeter getters.
- [ ] Create a `User` class with a read-only email property.

---

## 16. Quick Revision

| Concept | Meaning |
|---|---|
| Encapsulation | Bundling data and methods while controlling access |
| `_variable` | An identifier private to its Dart library |
| Getter | Reads a value through a property-like interface |
| Setter | Updates a value through a controlled interface |
| Validation | Checks whether data meets specified rules |
| Private field | A field that cannot be accessed directly from outside its library |
| Read-only property | A property exposed for reading without a public setter |
| Data hiding | Restricting direct access to internal implementation details |

### Final Definition for Exams

**Encapsulation is an OOP principle that combines data and the methods that operate on it within a class while controlling access to the internal state. In Dart, it is commonly implemented using classes, library-private identifiers, getters, setters, and methods with validation.**

---

**Recommended learning order:** Basic class → Private fields → Getters → Setters → Validation → Constructors → Read-only properties → Real-world examples.

Practice each example in a separate `.dart` file in VS Code to understand encapsulation step by step.