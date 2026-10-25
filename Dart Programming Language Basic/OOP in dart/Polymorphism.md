# Polymorphism in Dart

## 1. What is Polymorphism?

**Polymorphism** is an important concept of Object-Oriented Programming (OOP).

The word polymorphism means **"Many Forms."**

In Dart, polymorphism allows the same method or interface to behave differently depending on the object that uses it.

### Real-Life Example

Think about an animal:

- A Dog makes a barking sound.
- A Cat makes a meowing sound.
- A Cow makes a mooing sound.

All animals can make sounds, but each animal makes a different sound.

This is the basic idea of polymorphism.

## 2. Basic Example

```dart
class Animal {
  void makeSound() {
    print("Animal makes a sound");
  }
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

void main() {
  Animal animal1 = Dog();
  Animal animal2 = Cat();

  animal1.makeSound();
  animal2.makeSound();
}
```

### Output

```text
Dog barks
Cat meows
```

### Explanation

- `Animal` is the parent class.
- `Dog` and `Cat` inherit from `Animal`.
- `@override` means that a child class provides its own implementation of an inherited method.
- `Animal animal1 = Dog();` means an `Animal` reference holds a `Dog` object.
- When `makeSound()` is called, Dart executes the method belonging to the actual object.

This is called **runtime polymorphism**.

---

## 3. Types of Polymorphism

The main forms of polymorphism commonly discussed in OOP are:

1. Compile-time polymorphism
2. Runtime polymorphism

In Dart, runtime polymorphism is commonly implemented using method overriding. Compile-time polymorphism can be achieved through features such as generic types and interfaces, although Dart does not support traditional method overloading by defining multiple methods with the same name and different parameter lists.

## 4. Runtime Polymorphism (Method Overriding)

Runtime polymorphism occurs when a subclass overrides a method inherited from its parent class.

### Example

```dart
class Payment {
  void pay() {
    print("Processing payment");
  }
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
  Payment p1 = BkashPayment();
  Payment p2 = CardPayment();

  p1.pay();
  p2.pay();
}
```

### Output

```text
Payment through bKash
Payment through Card
```

### Explanation

Both variables have the type `Payment`, but they hold different objects.

Dart selects the overridden method according to the actual object at runtime.

### Important Terms

- **Method overriding:** Redefining an inherited method in a subclass.
- **Parent class:** The class being inherited from.
- **Child class:** The class that inherits from another class.
- **Dynamic dispatch:** Selecting the appropriate overridden method at runtime.

---

## 5. Polymorphism Using Abstract Classes

An abstract class defines a common structure that subclasses can implement.

You cannot create an instance of an abstract class directly.

### Example

```dart
abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.1416 * radius * radius;
  }
}

class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double area() {
    return length * width;
  }
}

void main() {
  Shape s1 = Circle(5);
  Shape s2 = Rectangle(4, 6);

  print("Circle area: ${s1.area()}");
  print("Rectangle area: ${s2.area()}");
}
```

### Output

```text
Circle area: 78.54
Rectangle area: 24.0
```

### Explanation

- `Shape` defines the `area()` method.
- `Circle` calculates the area of a circle.
- `Rectangle` calculates the area of a rectangle.
- Both objects can be handled through the common `Shape` type.

This makes the program easier to extend with new shapes.

---

## 6. Polymorphism Using Interfaces

In Dart, every class implicitly defines an interface.

A class can use `implements` to implement another class's interface. It must provide implementations for the interface's required instance members.

### Example

```dart
class Printer {
  void printDocument() {
    print("Printing document");
  }
}

class InkjetPrinter implements Printer {
  @override
  void printDocument() {
    print("Inkjet printer is printing");
  }
}

class LaserPrinter implements Printer {
  @override
  void printDocument() {
    print("Laser printer is printing");
  }
}

void main() {
  Printer p1 = InkjetPrinter();
  Printer p2 = LaserPrinter();

  p1.printDocument();
  p2.printDocument();
}
```

### Output

```text
Inkjet printer is printing
Laser printer is printing
```

### `extends` vs `implements`

| `extends`                                 | `implements`                                  |
| ----------------------------------------- | --------------------------------------------- |
| Inherits implementation from a superclass | Implements another class's interface          |
| Can reuse inherited method bodies         | Must implement the required interface members |
| Used for class inheritance                | Used to follow a contract                     |

---

## 7. Polymorphism Using Lists

Polymorphism becomes especially useful when working with multiple objects together.

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
  List<Animal> animals = [
    Dog(),
    Cat(),
    Cow(),
  ];

  for (Animal animal in animals) {
    animal.makeSound();
  }
}
```

### Output

```text
Dog barks
Cat meows
Cow moos
```

### Explanation

The list stores different types of objects using the common `Animal` type.

The loop calls the same method on each object, but each object behaves differently.

**This is one of the most useful practical applications of polymorphism.**

---

## 8. Polymorphism with Method Parameters

A function can accept a parent type and work with different child objects.

### Example

```dart
abstract class Notification {
  void send();
}

class EmailNotification extends Notification {
  @override
  void send() {
    print("Sending email");
  }
}

class SmsNotification extends Notification {
  @override
  void send() {
    print("Sending SMS");
  }
}

void sendNotification(Notification notification) {
  notification.send();
}

void main() {
  sendNotification(EmailNotification());
  sendNotification(SmsNotification());
}
```

### Output

```text
Sending email
Sending SMS
```

### Why is this useful?

The `sendNotification()` function does not need separate implementations for email and SMS.

You can add more notification types without changing the function itself, provided they follow the same interface or superclass contract.

---

## 9. Compile-Time Polymorphism and Generics

Dart does not support traditional method overloading, where multiple methods in the same class share a name but have different parameter lists.

However, **generics** let you write reusable code that works with different data types.

### Example

```dart
class Box<T> {
  T value;

  Box(this.value);

  void display() {
    print(value);
  }
}

void main() {
  Box<int> numberBox = Box(100);
  Box<String> textBox = Box("Hello Dart");

  numberBox.display();
  textBox.display();
}
```

### Output

```text
100
Hello Dart
```

### Explanation

- `T` is a type parameter.
- `Box<int>` stores an integer.
- `Box<String>` stores a string.
- The same class works with different data types.

Generics are a form of parametric polymorphism, though they are different from traditional method overloading.

---

## 10. Method Overriding vs Method Overloading

| Method Overriding                        | Method Overloading                                           |
| ---------------------------------------- | ------------------------------------------------------------ |
| A subclass redefines an inherited method | Multiple methods share a name with different parameter lists |
| Supported in Dart                        | Traditional form is not supported in Dart                    |
| Commonly used for runtime polymorphism   | Commonly associated with compile-time polymorphism           |
| Uses `@override` convention              | Not available as traditional same-name overloads             |

### Alternative in Dart

You can use optional or named parameters to support different calling patterns.

```dart
class Calculator {
  int add(int a, [int? b]) {
    return a + (b ?? 0);
  }
}

void main() {
  Calculator calculator = Calculator();

  print(calculator.add(5));
  print(calculator.add(5, 10));
}
```

### Output

```text
5
15
```

This is one method accepting different argument patterns, not traditional method overloading.

---

## 11. Advantages of Polymorphism

1. **Code reusability:** The same function can work with different object types.
2. **Flexibility:** Different classes can provide their own behavior.
3. **Maintainability:** Changes to one implementation often do not require changes to the calling code.
4. **Extensibility:** New subclasses can be added easily.
5. **Loose coupling:** Programs can depend on common interfaces rather than specific implementations.

## 12. Real-World Applications

Polymorphism is commonly used in:

- Payment systems
- Notification systems
- Banking applications
- Shape and graphics applications
- Game development
- Database access layers
- Flutter application architecture

For example, a Flutter application can use a common interface for different authentication providers, such as Google sign-in and email/password authentication.

---

## 13. Common Mistakes

### Mistake 1: Forgetting `@override`

The annotation is recommended because it helps catch accidental mistakes when overriding methods.

### Mistake 2: Creating an abstract class object

```dart
abstract class Animal {}

void main() {
  // Animal animal = Animal(); // Error
}
```

An abstract class cannot be instantiated directly.

### Mistake 3: Calling a child-only method through a parent reference

```dart
class Animal {}

class Dog extends Animal {
  void bark() {
    print("Barking");
  }
}

void main() {
  Animal animal = Dog();

  // animal.bark(); // Compile-time error
}
```

The variable's static type is `Animal`, which does not declare `bark()`.

---

## 14. Practice Tasks

Try solving these exercises yourself.

- [ ] Create a `Vehicle` parent class and `Car`, `Bike`, and `Bus` subclasses.
- [ ] Override a `start()` method in each subclass.
- [ ] Store the objects in a `List<Vehicle>` and call `start()` in a loop.
- [ ] Create an abstract `Employee` class with a `calculateSalary()` method.
- [ ] Implement `FullTimeEmployee` and `PartTimeEmployee`.
- [ ] Create a `PaymentMethod` interface and implement cash, card, and mobile payments.
- [ ] Create a generic `Storage<T>` class that can store different data types.

## 15. Quick Revision

| Concept              | Meaning                                                      |
| -------------------- | ------------------------------------------------------------ |
| Polymorphism         | One interface or common type, many behaviors                 |
| `extends`            | Inherit from a superclass                                    |
| `implements`         | Implement an interface contract                              |
| `@override`          | Mark an overridden member                                    |
| Abstract class       | A class that cannot be instantiated directly                 |
| Runtime polymorphism | The actual object's overridden method is selected at runtime |
| Generics             | Reusable code parameterized by type                          |

### Final Definition for Exams

**Polymorphism is an OOP concept that allows objects of different classes to be treated through a common type while providing different implementations of the same operation. In Dart, it is commonly achieved through method overriding, inheritance, abstract classes, and interfaces.**

---

**Recommended learning order:** Basic example → Method overriding → Abstract classes → Interfaces → Lists → Method parameters → Generics.

Keep practicing the examples in separate `.dart` files to understand how polymorphism works in real programs.
