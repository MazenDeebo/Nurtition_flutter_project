import 'package:flutter/material.dart';
import 'dart:math'; // For random number generation

class ListViewExample extends StatefulWidget {
  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<String> meals = [
    'Spaghetti Carbonara',
    'Chicken Caesar Salad',
    'Beef Tacos',
    'Vegetable Stir-fry',
    'Quinoa Salad',
    'Grilled Salmon',
    'Chicken Alfredo',
    'Beef and Broccoli',
    'Mushroom Risotto',
    'Greek Salad',
    'Quinoa Salad with Cucumber and Feta',
    'Zucchini Noodles with Pesto',
    'Grilled Shrimp Tacos with Salsa',
    'Roasted Brussels Sprouts and Chicken',
    'Steak with Mixed Vegetables',
    'Vegetable Curry with Brown Rice',
    'Shrimp Scampi with Zucchini Noodles',
    'Grilled Turkey with Asparagus',
    'Stuffed Bell Peppers with Quinoa',
    'Vegetarian Chili with Sweet Potatoes'
  ];

  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Meal Suggestions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/60.png'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.add(createNewItem());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget createNewItem() {
    // Generate a random meal name
    String mealName = meals[Random().nextInt(meals.length)];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(
            Icons.fastfood,
            color: Colors.white,
          ),
          title: Text(
            mealName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
