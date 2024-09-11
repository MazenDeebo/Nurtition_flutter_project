import 'dart:math'; // For generating random selections
import 'package:flutter/material.dart';
import 'ListViewExample.dart';
import 'ListViewExample.dart'; // Import the ListViewExample page

class SuggestionsPage extends StatelessWidget {
  final String name;
  final String height;
  final String weight;
  final String age;
  final String goal;

  SuggestionsPage({
    required this.name,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
  });

  // A large list of meal suggestions
  final List<String> meals = [
    'Grilled Chicken with Quinoa',
    'Salmon Salad with Avocado',
    'Vegetable Stir-Fry with Tofu',
    'Egg White Omelette with Spinach',
    'Turkey and Hummus Wrap',
    'Sweet Potato and Black Bean Bowl',
    'Greek Yogurt with Berries',
    'Lean Beef with Broccoli',
    'Oatmeal with Almond Butter',
    'Baked Cod with Asparagus',
    'Chicken Caesar Salad',
    'Protein Smoothie with Kale',
    'Lentil Soup with Whole Grain Bread',
    'Chickpea and Veggie Wrap',
    'Grilled Salmon with Mixed Vegetables',
    'Brown Rice with Grilled Shrimp',
    'Beef and Vegetable Skewers',
    'Eggs and Whole Wheat Toast',
    'Chicken and Wild Rice Soup',
    'Tuna Salad with Mixed Greens',
    'Avocado Toast with Poached Eggs',
    'Pasta with Marinara and Grilled Chicken',
    'Turkey Burger with Sweet Potato Fries',
    'Cottage Cheese with Pineapple',
    'Quinoa Salad with Cucumber and Feta',
    'Zucchini Noodles with Pesto',
    'Grilled Shrimp Tacos with Salsa',
    'Roasted Brussels Sprouts and Chicken',
    'Steak with Mixed Vegetables',
    'Greek Salad with Chicken',
    'Soba Noodles with Peanut Sauce',
    'Black Bean and Corn Salad',
    'Grilled Tofu with Sesame Soy Sauce',
    'Spaghetti Squash with Meatballs',
    'Smoothie Bowl with Chia Seeds',
    'Baked Chicken with Green Beans',
    'Vegetable Curry with Brown Rice',
    'Shrimp Scampi with Zucchini Noodles',
    'Grilled Turkey with Asparagus',
    'Stuffed Bell Peppers with Quinoa',
    'Vegetarian Chili with Sweet Potatoes'
  ];

  // Function to get 3 random meal suggestions
  List<String> getRandomMeals() {
    meals.shuffle(Random()); // Shuffle the list randomly
    return meals.take(3).toList(); // Take the first 3 meals after shuffling
  }

  @override
  Widget build(BuildContext context) {
    final List<String> selectedMeals = getRandomMeals(); // Get 3 random meals

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Meal Suggestions'),
      ),
      body: Container(
        // Adding the background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"), // Path of background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'Hello, $name!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color for better visibility on background
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Based on your data:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text('Height: $height cm', style: TextStyle(color: Colors.white)),
              Text('Weight: $weight kg', style: TextStyle(color: Colors.white)),
              Text('Age: $age', style: TextStyle(color: Colors.white)),
              Text('Goal: $goal', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              Text(
                'Suggested Meals:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Display the selected meals
              ...selectedMeals.map(
                    (meal) => ListTile(
                  title: Text(
                    meal,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ).toList(),
              SizedBox(height: 20),
              // Button to navigate to ListViewExample
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListViewExample()),
                    );
                  },
                  child: Text('View More Meals'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                    minimumSize: Size(200, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
