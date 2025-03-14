import 'package:flutter/material.dart';
import '../widgets/mood_button.dart';
import '../data/messages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showMessage(BuildContext context, String mood) {
    final message = getRandomMessage(mood);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(mood.toUpperCase()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mood Motivation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff0d0d0d),
      ),
      body: Stack(
        children: [
          // Background Image with opacity (opacity: 1 means fully visible)
          Positioned.fill(
            child: Opacity(
              opacity: 0.3, // Adjust the opacity as needed
              child: Image.asset(
                'images/download.jpg', // Path to your image
                fit: BoxFit.cover, // Make sure the image covers the entire screen
              ),
            ),
          ),
          // Buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 210, // Makes the buttons take up equal width
                  height: 70, // Set a fixed height for each button
                  child: MoodButton(
                    label: 'Angry',
                    color: Colors.red,
                    onPressed: () => showMessage(context, 'angry'),
                  ),
                ),
                SizedBox(
                  width: 210, // Makes the buttons take up equal width
                  height: 70, // Set a fixed height for each button
                  child: MoodButton(
                    label: 'Happy',
                    color: Colors.orangeAccent,
                    onPressed: () => showMessage(context, 'happy'),
                  ),
                ),
                SizedBox(
                  width: 210, // Makes the buttons take up equal width
                  height: 70, // Set a fixed height for each button
                  child: MoodButton(
                    label: 'Sad',
                    color: Colors.blue,
                    onPressed: () => showMessage(context, 'sad'),
                  ),
                ),
                SizedBox(
                  width: 210, // Makes the buttons take up equal width
                  height: 70, // Set a fixed height for each button
                  child: MoodButton(
                    label: 'Good',
                    color: Colors.green,
                    onPressed: () => showMessage(context, 'good'),
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
