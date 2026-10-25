# Inheritance in Dart — Basic to Advanced

## 1. What Is Inheritance?

**Inheritance** is an Object-Oriented Programming (OOP) concept that allows one class to acquire properties and methods from another class.

In simple words, a child class can reuse the code of a parent class instead of writing the same code again.

### Example in Real Life

- **Parent class:** Animal
- **Child class:** Dog
- Animal can eat.
- Dog can eat and bark.

The `Dog` class inherits the `eat()` method from the `Animal` class.

### Syntax

```dart
class Parent {
  void parentMethod() {
    print("This is the parent class");
  }
}

class Child extends Parent {
  void childMethod() {
    print("This is the child class");
  }
}

void main() {
  Child obj = Child();

  obj.parentMethod();
  obj.childMethod();
}
```

**Output:**
```text
This is the parent class
This is the child class
```

**Explanation:**
- `Parent` is the superclass (parent class).
- `Child` is the subclass (child class).
- `extends` is the keyword used for class inheritance.
- The child object can access inherited public methods.

---

## 2. Basic Inheritance

A child class can use the properties and methods of its parent class.

```dart
class Animal {
  String name = "Animal";

  void eat() {
    print("$name is eating");
  }
}

class Dog extends Animal {
  void bark() {
    print("Dog is barking");
  }
}

void main() {
  Dog dog = Dog();

  dog.eat();
  dog.bark();
}
```

**Output:**
```text
Animal is eating
Dog is barking
```

**Explanation:**

The `Dog` class inherits the `name` variable and `eat()` method from `Animal`. Therefore, we do not need to write them again in the `Dog` class.

---

## 3. Inheritance with Constructors

Constructors initialize objects. In Dart, a child class can pass values to the parent constructor using `super`.

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void display() {
    print("Name: $name");
    print("Age: $age");
  }
}

class Student extends Person {
  String department;

  Student(String name, int age, this.department)
      : super(name, age);

  void showDepartment() {
    print("Department: $department");
  }
}

void main() {
  Student student = Student("Taukir", 21, "CSE");

  student.display();
  student.showDepartment();
}
```

**Output:**
```text
Name: Taukir
Age: 21
Department: CSE
```

**Explanation:**

- `Person(this.name, this.age)` initializes the parent class.
- `super(name, age)` calls the parent constructor.
- `Student` adds its own `department` property.
- The student object can use both parent and child functionality.

**Important:** A child class does not automatically inherit the parent's constructors. It must initialize the parent appropriately.

---

## 4. Method Overriding

**Method overriding** happens when a child class provides its own implementation of a method already defined in the parent class.

```dart
class Animal {
  void sound() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Dog barks");
  }
}

void main() {
  Animal animal = Animal();
  Dog dog = Dog();

  animal.sound();
  dog.sound();
}
```

**Output:**
```text
Animal makes a sound
Dog barks
```

**Explanation:**

- The parent class defines `sound()`.
- The child class overrides `sound()`.
- `@override` indicates that a superclass member is being overridden.
- Calling `sound()` on a `Dog` object executes the dog's implementation.

This allows different classes to behave differently while using the same method name.

---

## 5. Using `super` to Call Parent Methods

The `super` keyword lets a child class access an implementation from its parent class.

```dart
class Animal {
  void sound() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    super.sound();
    print("Dog barks");
  }
}

void main() {
  Dog dog = Dog();
  dog.sound();
}
```

**Output:**
```text
Animal makes a sound
Dog barks
```

**Explanation:**

`super.sound()` calls the parent's version of the method. The child then executes its additional code.

Without `super.sound()`, only the child's overridden implementation would run.

---

## 6. Multilevel Inheritance

**Multilevel inheritance** occurs when a class inherits from another child class, forming a chain.

Example:

`Animal → Dog → Puppy`

```dart
class Animal {
  void eat() {
    print("Eating...");
  }
}

class Dog extends Animal {
  void bark() {
    print("Barking...");
  }
}

class Puppy extends Dog {
  void weep() {
    print("Puppy is weeping...");
  }
}

void main() {
  Puppy puppy = Puppy();

  puppy.eat();
  puppy.bark();
  puppy.weep();
}
```

**Output:**
```text
Eating...
Barking...
Puppy is weeping...
```

**Explanation:**

`Puppy` inherits from `Dog`, and `Dog` inherits from `Animal`. Consequently, a `Puppy` object can use the accessible methods from all three levels.

---

## 7. Hierarchical Inheritance

**Hierarchical inheritance** means multiple child classes inherit from the same parent class.

Example:

`Animal → Dog`

`Animal → Cat`

```dart
class Animal {
  void eat() {
    print("Animal is eating");
  }
}

class Dog extends Animal {
  void bark() {
    print("Dog barks");
  }
}

class Cat extends Animal {
  void meow() {
    print("Cat meows");
  }
}

void main() {
  Dog dog = Dog();
  Cat cat = Cat();

  dog.eat();
  dog.bark();

  cat.eat();
  cat.meow();
}
```

**Output:**
```text
Animal is eating
Dog barks
Animal is eating
Cat meows
```

**Explanation:**

Both `Dog` and `Cat` reuse the `eat()` method from `Animal`, but each class has its own additional behavior.

---

## 8. Polymorphism Through Inheritance

**Polymorphism** means one interface or parent type can represent objects with different behaviors.

```dart
class Animal {
  void sound() {
    print("Unknown animal sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Meow!");
  }
}

void main() {
  List<Animal> animals = [Dog(), Cat(), Animal()];

  for (Animal animal in animals) {
    animal.sound();
  }
}
```

**Output:**
```text
Woof!
Meow!
Unknown animal sound
```

**Explanation:**

- The list has the type `Animal`.
- It contains objects of `Dog`, `Cat`, and `Animal`.
- Dart executes the overridden method that matches each object's actual runtime type.

This is called **runtime polymorphism** and is commonly used in real-world applications.

---

## 9. Abstract Classes and Inheritance

An **abstract class** is a class that cannot be instantiated directly. It can define common behavior and require subclasses to implement certain methods.

```dart
abstract class Shape {
  double area();

  void display() {
    print("Calculating area...");
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

void main() {
  Rectangle rectangle = Rectangle(5, 4);

  rectangle.display();
  print("Area: ${rectangle.area()}");
}
```

**Output:**
```text
Calculating area...
Area: 20.0
```

**Explanation:**

- `abstract class Shape` defines a general shape.
- `double area();` declares an abstract method without a body.
- `Rectangle extends Shape` inherits the common behavior.
- `Rectangle` implements the required `area()` method.

You cannot create an object directly using `Shape()` because it is abstract.

---

## 10. Getters and Setters in Inheritance

Child classes can use accessible getters and setters inherited from their parent.

```dart
class Employee {
  double _salary = 0;

  double get salary => _salary;

  set salary(double value) {
    if (value >= 0) {
      _salary = value;
    }
  }
}

class Manager extends Employee {
  void showSalary() {
    print("Salary: $salary");
  }
}

void main() {
  Manager manager = Manager();

  manager.salary = 50000;
  manager.showSalary();
}
```

**Output:**
```text
Salary: 50000.0
```

**Explanation:**

- `_salary` is a library-private field.
- `salary` is a public getter and setter.
- `Manager` inherits the accessible getter and setter from `Employee`.
- The setter prevents negative salary values.

**Note:** Dart privacy is library-based, not class-based. A leading underscore makes a name private to its library.

---

## 11. Important Rules of Inheritance in Dart

1. Use `extends` to inherit from a class.
2. A Dart class can extend only one superclass.
3. A child class inherits accessible instance members, not constructors.
4. Use `super()` to initialize the parent when required.
5. Use `@override` when redefining an inherited method.
6. Use `super.methodName()` to call the parent implementation.
7. Abstract classes cannot be instantiated directly.
8. Inherited methods can be overridden to implement runtime polymorphism.
9. Static members belong to the class and are not ordinary inherited instance members.
10. Dart uses `with` for mixins, which allow behavior reuse without multiple class inheritance.

---

## 12. Advanced Example: Employee Management

This example combines inheritance, constructors, method overriding, `super`, and polymorphism.

```dart
class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void displayInfo() {
    print("Name: $name");
    print("Salary: $salary");
  }

  double calculateBonus() {
    return salary * 0.05;
  }
}

class Developer extends Employee {
  String language;

  Developer(String name, double salary, this.language)
      : super(name, salary);

  @override
  void displayInfo() {
    super.displayInfo();
    print("Language: $language");
  }

  @override
  double calculateBonus() {
    return salary * 0.10;
  }
}

class Manager extends Employee {
  int teamSize;

  Manager(String name, double salary, this.teamSize)
      : super(name, salary);

  @override
  double calculateBonus() {
    return salary * 0.15;
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("Team Size: $teamSize");
  }
}

void main() {
  List<Employee> employees = [
    Developer("Taukir", 50000, "Dart"),
    Manager("Rahim", 80000, 10),
  ];

  for (Employee employee in employees) {
    employee.displayInfo();
    print("Bonus: ${employee.calculateBonus()}");
    print("--------------------");
  }
}
```

**Output:**
```text
Name: Taukir
Salary: 50000.0
Language: Dart
Bonus: 5000.0
--------------------
Name: Rahim
Salary: 80000.0
Team Size: 10
Bonus: 12000.0
--------------------
```

**What this example teaches:**

- `Developer` and `Manager` inherit from `Employee`.
- `super(name, salary)` initializes the inherited properties.
- Both child classes override `displayInfo()`.
- Each child class calculates its bonus differently.
- A `List<Employee>` stores different employee types.
- Runtime polymorphism selects the correct implementation for each object.

This pattern is useful for employee systems, banking applications, games, and other object-oriented software.

---

## 13. Inheritance vs Mixins vs Interfaces

| Feature | Purpose | Dart syntax |
|---|---|---|
| Inheritance | Reuse and extend a superclass | `extends` |
| Mixins | Reuse behavior across unrelated classes | `with` |
| Interfaces | Define a contract a class must implement | `implements` |

Dart does not support multiple superclass inheritance. However, a class can implement multiple interfaces and use multiple mixins when their constraints are satisfied.

### Example of a Mixin

```dart
mixin Swimmer {
  void swim() {
    print("Swimming...");
  }
}

class Fish with Swimmer {}

void main() {
  Fish fish = Fish();
  fish.swim();
}
```

**Output:**
```text
Swimming...
```

### Example of an Interface

```dart
abstract class Printable {
  void printData();
}

class Report implements Printable {
  @override
  void printData() {
    print("Printing report...");
  }
}

void main() {
  Report report = Report();
  report.printData();
}
```

**Output:**
```text
Printing report...
```

**Important distinction:** With `implements`, the class must provide implementations for the interface's instance members. It does not automatically reuse their method implementations.

---

## 14. Common Mistakes

### Mistake 1: Forgetting `super`

```dart
class Person {
  String name;

  Person(this.name);
}

class Student extends Person {
  Student(String name) : super(name);
}
```

The parent constructor must be initialized correctly. Here, `super(name)` passes the student's name to `Person`.

### Mistake 2: Incorrect method signature

An overriding method must be compatible with the inherited method's signature and return type.

### Mistake 3: Trying to extend two classes

```dart
// Invalid Dart syntax:
// class C extends A, B {}
```

A class can have only one superclass. Use mixins or interfaces when you need additional reusable behavior or contracts.

### Mistake 4: Instantiating an abstract class

```dart
// Invalid:
// Shape shape = Shape();
```

Create an instance of a concrete subclass instead.

---

## 15. Practice Problems

Try solving these problems yourself before checking other examples.

1. Create a `Vehicle` class with a `start()` method. Extend it with `Car` and `Bike`.
2. Create a `Person` class with `name` and `age`. Extend it with `Student`, adding `studentId`.
3. Create a `BankAccount` class with a `deposit()` method. Extend it with `SavingsAccount`.
4. Create an abstract `Payment` class with a `pay()` method. Implement it in `CashPayment` and `CardPayment`.
5. Create an `Animal` superclass with `sound()`. Override it in `Dog`, `Cat`, and `Cow`.
6. Create an `Employee` superclass and subclasses `Developer` and `Manager`. Calculate their bonuses differently and store them in a single list.

---

## 16. Quick Revision

- **Inheritance:** Reusing and extending a class.
- **Superclass:** The parent class.
- **Subclass:** The child class.
- **`extends`:** Inherits from a superclass.
- **`super`:** Accesses superclass constructors or implementations.
- **`@override`:** Indicates an overridden member.
- **Multilevel inheritance:** A chain of inheritance.
- **Hierarchical inheritance:** Multiple subclasses share one superclass.
- **Polymorphism:** Different implementations through a common type.
- **Abstract class:** A class that cannot be instantiated directly.
- **Mixin:** Reusable behavior added with `with`.
- **Interface:** A contract implemented with `implements`.

### Final Note

Inheritance promotes code reuse and supports polymorphism. Use it when there is a genuine **“is-a” relationship**, such as a `Dog` being an `Animal` or a `Developer` being an `Employee`.

For unrelated classes that simply need the same behavior, consider mixins or composition instead.

**Recommended practice:** Save each example in a separate `.dart` file and run it with:

```bash
dart run filename.dart
```
