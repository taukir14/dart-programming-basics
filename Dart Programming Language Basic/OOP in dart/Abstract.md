# Abstract Classes in Dart

## 1. What is an Abstract Class?

An **abstract class** is a class that cannot be used to create objects directly. It is designed to act as a blueprint for other classes.

In Dart, we use the `abstract` keyword to declare an abstract class.

### Real-Life Example

Think about a vehicle.

- A Car can start its engine.
- A Bike can start its engine.
- A Bus can start its engine.

All vehicles have a starting behavior, but each vehicle may implement that behavior differently.

We can define a common blueprint called `Vehicle` and let each child class implement its own behavior.

## 2. Basic Example

```dart
abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks");
  }
}

void main() {
  Dog dog = Dog();

  dog.makeSound();
}
```

### Output

```text
Dog barks
```

### Explanation

- `abstract class Animal` declares an abstract class.
- `void makeSound();` declares a method without a body.
- `class Dog extends Animal` inherits from the abstract class.
- `@override` indicates that the child class provides an implementation of the method.
- `Dog dog = Dog();` creates a Dog object.
- `dog.makeSound();` calls the implemented method.

**Important:** You cannot create an object directly from an abstract class.

```dart
abstract class Animal {
  void makeSound();
}

void main() {
  // Animal animal = Animal(); // Error
}
```

---

## 3. Abstract Methods

An **abstract method** is a method declared without an implementation.

In Dart, abstract methods can be declared inside abstract classes.

### Example

```dart
abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.1416 * radius * radius;
  }
}

void main() {
  Circle circle = Circle(5);

  print("Area: ${circle.calculateArea()}");
}
```

### Output

```text
Area: 78.54
```

### Explanation

The `calculateArea()` method has no body in `Shape`.

The `Circle` class provides the actual calculation.

An abstract method defines **what a class must do**, while the child class determines **how it does it**.

---

## 4. Abstract Class with Multiple Child Classes

One abstract class can be inherited by multiple child classes.

### Example

```dart
abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat meows");
  }
}

class Cow extends Animal {
  @override
  void makeSound() {
    print("Cow moos");
  }
}

void main() {
  Dog dog = Dog();
  Cat cat = Cat();
  Cow cow = Cow();

  dog.makeSound();
  cat.makeSound();
  cow.makeSound();
}
```

### Output

```text
Dog barks
Cat meows
Cow moos
```

### Explanation

- `Animal` provides a common blueprint.
- `Dog`, `Cat`, and `Cow` implement their own versions of `makeSound()`.
- Each child class provides a different behavior.

This approach helps maintain a consistent structure across related classes.

---

## 5. Abstract Class with Normal Methods

An abstract class can contain both abstract methods and normal methods.

A normal method has a body and can provide reusable functionality to child classes.

### Example

```dart
abstract class Employee {
  void calculateSalary();

  void showCompany() {
    print("Company: Google");
  }
}

class Developer extends Employee {
  @override
  void calculateSalary() {
    print("Salary: 80000");
  }
}

void main() {
  Developer developer = Developer();

  developer.showCompany();
  developer.calculateSalary();
}
```

### Output

```text
Company: Google
Salary: 80000
```

### Explanation

- `calculateSalary()` is an abstract method.
- `showCompany()` is a normal method.
- `Developer` must implement the inherited abstract method.
- `Developer` can reuse the existing `showCompany()` method without overriding it.

**Remember:** Abstract classes can contain implemented methods, constructors, fields, and abstract methods.

---

## 6. Abstract Class with Constructors

An abstract class can have a constructor.

Although you cannot create an abstract class object directly, its constructor can be called when a child class is instantiated.

### Example

```dart
abstract class Person {
  String name;

  Person(this.name);

  void introduce();
}

class Student extends Person {
  Student(String name) : super(name);

  @override
  void introduce() {
    print("My name is $name");
  }
}

void main() {
  Student student = Student("Taukir");

  student.introduce();
}
```

### Output

```text
My name is Taukir
```

### Explanation

- `Person(this.name)` initializes the `name` field.
- `Student(String name) : super(name)` calls the parent constructor.
- The inherited `name` field is available inside `Student`.
- The child class implements `introduce()`.

The constructor initializes the shared data before the child class uses it.

---

## 7. Abstract Class and Polymorphism

Abstract classes are frequently used to achieve runtime polymorphism.

### Example

```dart
abstract class Payment {
  void pay();
}

class BkashPayment extends Payment {
  @override
  void pay() {
    print("Payment through bKash");
  }
}

class CardPayment extends Payment {
  @override
  void pay() {
    print("Payment through Card");
  }
}

void main() {
  Payment payment1 = BkashPayment();
  Payment payment2 = CardPayment();

  payment1.pay();
  payment2.pay();
}
```

### Output

```text
Payment through bKash
Payment through Card
```

### Explanation

Both variables use the `Payment` type, but they hold different objects.

When `pay()` is called, Dart executes the implementation associated with the actual object.

This makes it possible to add new payment methods without changing the code that uses the common `Payment` type.

---

## 8. Abstract Class with Lists

You can store multiple child-class objects in a list using the abstract parent type.

### Example

```dart
abstract class Shape {
  void draw();
}

class Circle extends Shape {
  @override
  void draw() {
    print("Drawing Circle");
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print("Drawing Rectangle");
  }
}

class Triangle extends Shape {
  @override
  void draw() {
    print("Drawing Triangle");
  }
}

void main() {
  List<Shape> shapes = [
    Circle(),
    Rectangle(),
    Triangle(),
  ];

  for (Shape shape in shapes) {
    shape.draw();
  }
}
```

### Output

```text
Drawing Circle
Drawing Rectangle
Drawing Triangle
```

### Explanation

- `List<Shape>` stores objects that are subtypes of `Shape`.
- Every child class implements `draw()`.
- The loop calls the same method on every object.
- Each object executes its own implementation.

This is useful when working with many related objects.

---

## 9. Abstract Class with Fields and Getters

Abstract classes can define shared fields and getters for their child classes.

### Example

```dart
abstract class Product {
  String name;
  double price;

  Product(this.name, this.price);

  double get finalPrice;

  void display() {
    print("Product: $name");
    print("Price: $price");
    print("Final Price: $finalPrice");
  }
}

class DiscountedProduct extends Product {
  double discount;

  DiscountedProduct(
    String name,
    double price,
    this.discount,
  ) : super(name, price);

  @override
  double get finalPrice {
    return price - (price * discount / 100);
  }
}

void main() {
  DiscountedProduct product =
      DiscountedProduct("Laptop", 80000, 10);

  product.display();
}
```

### Output

```text
Product: Laptop
Price: 80000.0
Final Price: 72000.0
```

### Explanation

- `name` and `price` are shared fields.
- `double get finalPrice;` declares an abstract getter.
- `DiscountedProduct` implements the getter.
- The final price is calculated using the discount percentage.

This example demonstrates how an abstract class can define shared data and require child classes to provide specific calculations.

---

## 10. Abstract Class vs Normal Class

| Abstract Class | Normal Class |
|---|---|
| Cannot be instantiated directly | Can be instantiated if its constructor permits it |
| Can contain abstract methods | Cannot declare abstract methods |
| Can contain normal methods | Can contain normal methods |
| Can contain fields and constructors | Can contain fields and constructors |
| Often used as a blueprint | Often used to create objects directly |

### Example

```dart
class Car {
  void start() {
    print("Car started");
  }
}

abstract class Vehicle {
  void start();
}

void main() {
  Car car = Car();

  // Vehicle vehicle = Vehicle(); // Error

  car.start();
}
```

### Output

```text
Car started
```

---

## 11. Abstract Class vs Interface in Dart

Every Dart class implicitly defines an interface. A class can implement that interface using `implements`.

| Abstract Class with `extends` | Interface with `implements` |
|---|---|
| Can reuse inherited implementations | Must implement the required interface members |
| Can provide shared state and behavior | Defines a contract for compatible objects |
| Uses `extends` | Uses `implements` |
| Useful for closely related classes | Useful when different classes should follow the same contract |

### Example

```dart
abstract class Animal {
  void eat() {
    print("Animal is eating");
  }

  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks");
  }
}

class Robot implements Animal {
  @override
  void eat() {
    print("Robot consumes energy");
  }

  @override
  void makeSound() {
    print("Robot makes a beep sound");
  }
}

void main() {
  Dog dog = Dog();
  Robot robot = Robot();

  dog.eat();
  dog.makeSound();

  robot.eat();
  robot.makeSound();
}
```

### Output

```text
Animal is eating
Dog barks
Robot consumes energy
Robot makes a beep sound
```

### Important Difference

`Dog extends Animal`, so it inherits the existing `eat()` implementation.

`Robot implements Animal`, so it must provide implementations for both `eat()` and `makeSound()`.

---

## 12. Advantages of Abstract Classes

1. **Abstraction:** Hides implementation details and exposes required behavior.
2. **Code reusability:** Shared methods can be implemented once in the parent class.
3. **Consistency:** Child classes follow a common structure.
4. **Maintainability:** Common functionality can be managed in one place.
5. **Polymorphism:** Different child objects can be handled using a common parent type.
6. **Extensibility:** New child classes can be added without rewriting existing calling code.

## 13. Real-World Applications

Abstract classes can be useful in:

- Payment processing systems
- Employee management systems
- Banking applications
- Shape and graphics programs
- Notification systems
- Game development
- Flutter application architecture

For example, an application might define an abstract `AuthenticationService` with a `login()` method. Different child classes can implement login through email, Google, or another authentication provider.

---

## 14. Common Mistakes

### Mistake 1: Creating an abstract class object

```dart
abstract class Animal {
  void eat();
}

void main() {
  // Animal animal = Animal(); // Error
}
```

**Solution:** Create an object of a concrete child class.

### Mistake 2: Not implementing an abstract method

```dart
abstract class Animal {
  void makeSound();
}

// This class is invalid because it does not implement makeSound().
class Dog extends Animal {}
```

**Solution:** Implement the missing method, or declare the child class abstract as well.

### Mistake 3: Forgetting the `@override` annotation

```dart
abstract class Animal {
  void eat();
}

class Dog extends Animal {
  @override
  void eat() {
    print("Dog is eating");
  }
}
```

The annotation is recommended because it helps identify mistakes in overridden member declarations.

### Mistake 4: Thinking every method in an abstract class is abstract

```dart
abstract class Animal {
  void eat();

  void sleep() {
    print("Animal is sleeping");
  }
}
```

Here, `eat()` is abstract, while `sleep()` is a normal method with an implementation.

---

## 15. Practice Tasks

Try completing these exercises yourself.

- [ ] Create an abstract `Vehicle` class with a `start()` method.
- [ ] Create `Car`, `Bike`, and `Bus` classes that extend `Vehicle`.
- [ ] Create an abstract `Employee` class with a `calculateSalary()` method.
- [ ] Implement `FullTimeEmployee` and `PartTimeEmployee`.
- [ ] Create an abstract `Shape` class with an abstract `area` getter.
- [ ] Implement `Circle` and `Rectangle` classes.
- [ ] Create an abstract `PaymentMethod` class with a shared method and an abstract method.
- [ ] Create a list of different child-class objects and call their methods in a loop.
- [ ] Create an abstract `Account` class with a constructor, fields, and an abstract `calculateInterest()` method.

---

## 16. Quick Revision

| Concept | Meaning |
|---|---|
| `abstract` | Keyword used to declare an abstract class |
| Abstract class | A class that cannot be instantiated directly |
| Abstract method | A method declared without an implementation |
| `extends` | Inherits from a superclass |
| `@override` | Marks an overridden member |
| Concrete class | A class that can be instantiated when its constructor permits it |
| Abstraction | Exposing essential behavior while hiding implementation details |
| Polymorphism | Using a common type for objects with different behaviors |

### Final Definition for Exams

**An abstract class is a class declared using the `abstract` keyword that cannot be instantiated directly. It can contain abstract methods, normal methods, fields, and constructors. It provides a common blueprint for subclasses, which implement the required abstract methods.**

---

**Recommended learning order:** Basic abstract class → Abstract methods → Normal methods → Constructors → Polymorphism → Lists → Getters → Interfaces.

Practice each example in a separate `.dart` file in VS Code to understand how abstract classes work in Dart.