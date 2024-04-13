import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart'; // Import QuizProvider class

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _userAnswerIndex = -1; // Store the index of the user's selected answer

  @override
  Widget build(BuildContext context) {
    // Access QuizProvider instance using Provider.of
    final quizProvider = Provider.of<QuizProvider>(context);

    // Access current question from QuizProvider
    final currentQuestion = quizProvider.currentQuestion;

    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Display current question text
                    Text(
                      currentQuestion.text,
                      style: TextStyle(fontSize: 24),
                    ),
                    // Display radio buttons for choices
                    ...currentQuestion.choices.map((choice) {
                      return RadioListTile<int>(
                        title: Text(choice),
                        value: currentQuestion.choices.indexOf(choice),
                        groupValue: _userAnswerIndex,
                        onChanged: (value) {
                          setState(() {
                            _userAnswerIndex = value!;
                          });
                        },
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
          // Submit button to submit the answer
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity, // Take full width
              child: ElevatedButton(
                onPressed: _userAnswerIndex != -1
                    ? () {
                        // Call answerQuestion method from QuizProvider
                        quizProvider.answerQuestion(_userAnswerIndex, context);
                        setState(() {
                          _userAnswerIndex = -1; // Reset user's answer index
                        });
                      }
                    : null,
                child: Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
