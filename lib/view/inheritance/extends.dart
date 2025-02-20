import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';

class Animal {
  final String name;
  final int age;

  Animal(this.name, this.age);

  void makeNoise() {
    print("generic make noice");
  }

  void eatFood() {
    print('"$name" is eating');
  }
}

class Dog extends Animal {
  String color;

  Dog(this.color, super.name, super.age);

  void bark() {
    print("barking loudly");
  }

  @override
  void eatFood() {
    print("eat veg and non veg");
  }
}

class Cat extends Animal {
  String breed;

  Cat(super.name, super.age, this.breed);

  @override
  void makeNoise() {
    print("Meow");
  }

  void meow() {
    print("$name is meowing softly");
  }
}

class Extends extends StatefulWidget {
  const Extends({super.key});

  @override
  State<Extends> createState() => _ExtendsState();
}

class _ExtendsState extends State<Extends> {
  Dog myDog = Dog("red", "kaliya", 4);
  Cat myCat = Cat("billi", 2, "white breed");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("Inheritance", true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("my dog color is : ${myDog.color} "),
            Text("my dog name is : ${myDog.name}"),
            Text("my dog age is : ${myDog.age}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                myDog.makeNoise(); // Calls the inherited method
                myDog.eatFood(); // Calls the overridden method
                myDog.bark(); // Calls the Dog-specific method
              },
              child: const Text("Dog Actions"),
            ),
            const SizedBox(height: 20), //spacing
          ],
        ),
      ),
    );
  }
}
