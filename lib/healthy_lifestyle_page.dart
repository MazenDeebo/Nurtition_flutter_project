import 'package:flutter/material.dart';

class HealthyLifestylePage extends StatelessWidget {
  final String name;
  final String height;
  final String weight;
  final String age;
  final String goal;

  HealthyLifestylePage({
    required this.name,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Healthy Lifestyle Tips'),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/healthy.png'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Hello, $name!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure text is readable
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Here are some tips for a healthier lifestyle:',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 10),
                // Tips List
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                          '1. Eat a Balanced Diet',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Include a variety of fruits, vegetables, lean proteins, and whole grains in your diet.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '2. Stay Hydrated',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Drink plenty of water throughout the day to keep your body hydrated.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '3. Exercise Regularly',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Engage in at least 150 minutes of moderate aerobic activity or 75 minutes of vigorous activity each week.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '4. Get Enough Sleep',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Aim for 7-9 hours of quality sleep each night to help your body recover and stay healthy.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '5. Manage Stress',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Practice relaxation techniques such as meditation or yoga to manage stress effectively.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous page
                  },
                  child: Text('Back to Home'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), backgroundColor: Colors.orange,
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
