# Interfaces in Dart

## 1. What is an Interface?

An **interface** is a contract that defines what methods and properties a class must provide.

In Dart, every class implicitly defines an interface. We use the `implements` keyword when a class wants to implement another class's interface.

### Real-Life Example

Think about a USB port.

- A keyboard uses the USB connection.
- A mouse uses the USB connection.
- A printer uses the USB connection.

Different devices work differently, but they follow the same connection standard.

Similarly, different classes can implement the same interface while providing their own behavior.

---

## 2. Basic Example

```dart
class Animal {
  void makeSound() {
    print("Animal makes a sound");
  }
}

class Dog implements Animal {
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

- `Animal` defines an interface.
- `Dog implements Animal` means that `Dog` agrees to follow the interface contract.
- `Dog` must implement the required instance members of `Animal`.
- `@override` indicates that `Dog` provides its own implementation of `makeSound()`.

**Important:** Unlike `extends`, `implements` does not inherit the original method implementation. The implementing class must provide the required implementations itself.

---

## 3. Interface with Multiple Methods

An interface can define multiple methods that an implementing class must provide.

### Example

```dart
class Vehicle {
  void start() {
    print("Vehicle starts");
  }

  void stop() {
    print("Vehicle stops");
  }
}

class Car implements Vehicle {
  @override
  void start() {
    print("Car engine started");
  }

  @override
  void stop() {
    print("Car engine stopped");
  }
}

void main() {
  Car car = Car();

  car.start();
  car.stop();
}
```

### Output

```text
Car engine started
Car engine stopped
```

### Explanation

Although `Vehicle` contains method bodies, `Car` does not inherit those implementations because it uses `implements`.

Therefore, `Car` must implement both `start()` and `stop()`.

---

## 4. Interface with Fields and Getters

In Dart, an interface can also define properties through fields and getters.

When a class implements that interface, it must provide the required property accessors.

### Example

```dart
class Person {
  String name = "";
  int age = 0;
}

class Student implements Person {
  @override
  String name;

  @override
  int age;

  Student(this.name, this.age);
}

void main() {
  Student student = Student("Taukir", 21);

  print("Name: ${student.name}");
  print("Age: ${student.age}");
}
```

### Output

```text
Name: Taukir
Age: 21
```

### Explanation

- `Person` defines the `name` and `age` properties.
- `Student` implements the `Person` interface.
- `Student` provides its own fields for those properties.
- The constructor initializes both values.

**Remember:** With `implements`, you must implement the required interface members, including getters and setters where applicable.

---

## 5. Implementing Multiple Interfaces

Dart allows a class to implement multiple interfaces using a comma-separated list.

### Example

```dart
class Camera {
  void takePhoto() {}
}

class MusicPlayer {
  void playMusic() {}
}

class Smartphone implements Camera, MusicPlayer {
  @override
  void takePhoto() {
    print("Taking a photo");
  }

  @override
  void playMusic() {
    print("Playing music");
  }
}

void main() {
  Smartphone phone = Smartphone();

  phone.takePhoto();
  phone.playMusic();
}
```

### Output

```text
Taking a photo
Playing music
```

### Explanation

- `Camera` defines the `takePhoto()` member.
- `MusicPlayer` defines the `playMusic()` member.
- `Smartphone` implements both interfaces.
- Therefore, `Smartphone` must provide both methods.

This is useful when one class needs to support multiple sets of behaviors.

---

## 6. Interface with Polymorphism

Interfaces are commonly used to achieve runtime polymorphism.

### Example

```dart
class Payment {
  void pay() {}
}

class BkashPayment implements Payment {
  @override
  void pay() {
    print("Payment through bKash");
  }
}

class CardPayment implements Payment {
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

Dart calls the implementation belonging to the actual object.

The program can work with different payment methods through the same interface.

---

## 7. Interface with Method Parameters

A function can accept an interface type as a parameter.

This allows the function to work with different classes that implement the same contract.

### Example

```dart
class Notification {
  void send() {}
}

class EmailNotification implements Notification {
  @override
  void send() {
    print("Sending email");
  }
}

class SmsNotification implements Notification {
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

### Explanation

- `Notification` defines a common contract.
- `EmailNotification` and `SmsNotification` implement that contract.
- `sendNotification()` accepts any compatible object.
- New notification types can be introduced without rewriting the function.

This design reduces dependency on specific implementations.

---

## 8. Interface with Lists

You can store multiple implementations in one list using their common interface type.

### Example

```dart
class Shape {
  double area() => 0;
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.1416 * radius * radius;
  }
}

class Rectangle implements Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double area() {
    return length * width;
  }
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6),
  ];

  for (Shape shape in shapes) {
    print("Area: ${shape.area()}");
  }
}
```

### Output

```text
Area: 78.54
Area: 24.0
```

### Explanation

- `List<Shape>` stores objects implementing the `Shape` interface.
- `Circle` calculates a circle's area.
- `Rectangle` calculates a rectangle's area.
- The loop calls the same method on each object.

This is a practical combination of interfaces and polymorphism.

---

## 9. Interface vs Abstract Class

Both interfaces and abstract classes can define a common contract, but they serve somewhat different purposes.

| Interface using `implements` | Abstract class using `extends` |
|---|---|
| Defines a contract that a class agrees to implement | Provides a base class for related classes |
| Does not reuse the source class's method implementations | Can reuse inherited method implementations |
| Can implement multiple interfaces | Can extend only one class |
| Implementing class provides required members | Child implements inherited abstract methods and can reuse concrete methods |
| Useful for defining capabilities | Useful for sharing common behavior and state |

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

### Explanation

`Dog extends Animal`, so it inherits the existing `eat()` implementation.

`Robot implements Animal`, so it must provide its own implementations of both `eat()` and `makeSound()`.

---

## 10. Interface vs `extends` vs `implements`

| Keyword | Purpose |
|---|---|
| `extends` | Inherits from a superclass |
| `implements` | Implements the interface of another class |
| `with` | Adds behavior from one or more mixins |

### Example

```dart
class Animal {
  void eat() {
    print("Eating");
  }
}

class Dog extends Animal {}

void main() {
  Dog dog = Dog();

  dog.eat();
}
```

### Output

```text
Eating
```

Here, `Dog` inherits the implementation of `eat()` through `extends`.

If `Dog` used `implements Animal` instead, it would need to provide its own `eat()` implementation.

---

## 11. Advantages of Interfaces

1. **Flexibility:** Different classes can follow the same contract.
2. **Loose coupling:** Code can depend on a common type instead of a specific class.
3. **Extensibility:** New implementations can be added easily.
4. **Testability:** Alternative implementations can be used in tests.
5. **Polymorphism:** Different objects can be handled through one interface.
6. **Maintainability:** Implementation details can change while the public contract remains stable.

## 12. Real-World Applications

Interfaces are useful in:

- Payment processing systems
- Notification services
- Authentication systems
- Database repositories
- File storage services
- Game development
- Flutter application architecture

For example, a Flutter application might define a `StorageService` interface and provide different implementations for local storage and cloud storage.

The rest of the application can depend on the common interface instead of directly depending on one storage implementation.

---

## 13. Common Mistakes

### Mistake 1: Forgetting to implement a method

```dart
class Animal {
  void makeSound() {}
}

class Dog implements Animal {
  // Missing makeSound() implementation
}
```

This produces a compile-time error because `Dog` has not implemented the required member.

### Mistake 2: Assuming `implements` inherits method bodies

```dart
class Animal {
  void eat() {
    print("Eating");
  }
}

class Dog implements Animal {
  @override
  void eat() {
    print("Dog is eating");
  }
}
```

Even though `Animal.eat()` has a body, `Dog` must provide its own implementation.

### Mistake 3: Forgetting property accessors

If an interface defines a readable and writable property, an implementing class must provide the corresponding getter and setter behavior.

### Mistake 4: Confusing an interface with an object

An interface defines a contract. An object is an instance of a concrete class that provides behavior.

---

## 14. Practice Tasks

Try solving these exercises yourself.

- [ ] Create a `Vehicle` interface with `start()` and `stop()` methods.
- [ ] Implement it in `Car`, `Bike`, and `Bus` classes.
- [ ] Create `Camera` and `MusicPlayer` classes and implement both interfaces in a `Smartphone` class.
- [ ] Create a `PaymentMethod` interface with a `pay()` method.
- [ ] Implement `CashPayment`, `CardPayment`, and `BkashPayment`.
- [ ] Write a function that accepts a `PaymentMethod` and calls `pay()`.
- [ ] Create a `Shape` interface with an `area()` method.
- [ ] Implement `Circle` and `Rectangle` and store them in a `List<Shape>`.
- [ ] Create a `StorageService` interface and implement `LocalStorage` and `CloudStorage`.

---

## 15. Quick Revision

| Concept | Meaning |
|---|---|
| Interface | A contract that defines required members |
| `implements` | Implements another class's interface |
| `extends` | Inherits implementation from a superclass |
| `@override` | Marks an overridden member |
| Multiple interfaces | A class can implement multiple interfaces |
| Polymorphism | Different implementations can be used through a common type |
| Loose coupling | Reducing dependence on specific implementations |

### Final Definition for Exams

**In Dart, an interface defines a contract that specifies the members a class must implement. Every class implicitly defines an interface, and the `implements` keyword allows another class to implement that interface. Interfaces support abstraction, code flexibility, and runtime polymorphism.**

---

**Recommended learning order:** Basic interface → Multiple methods → Properties → Multiple interfaces → Polymorphism → Lists → Abstract class comparison → Real-world applications.

Practice each example in a separate `.dart` file in VS Code to understand interfaces step by step.