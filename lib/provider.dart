import 'package:flutter/material.dart';
import 'package:vivek_videosdk/model.dart'; // Import the Question model

// Define a provider class to manage quiz state
class QuizProvider extends ChangeNotifier {
  List<Question> questions; // List of quiz questions
  int _currentQuestionIndex; // Index of the current question
  int _score; // Current score of the quiz
  bool _quizCompleted; // Indicates if the quiz is completed

  // Constructor to initialize the quiz provider
  QuizProvider({
    required this.questions, // Required parameter for the list of questions
    int initialQuestionIndex =
        0, // Initial index of the current question (default is 0)
    int initialScore = 0, // Initial score of the quiz (default is 0)
  })  : _currentQuestionIndex = initialQuestionIndex,
        _score = initialScore,
        _quizCompleted = false;

  // Getter method to retrieve the current question
  Question get currentQuestion {
    // If the current question index is out of bounds, reset it to 0
    if (_currentQuestionIndex >= questions.length) {
      _currentQuestionIndex = 0;
    }
    // Return the current question based on the current index
    return questions[_currentQuestionIndex];
  }

  // Getter method to check if the quiz is completed
  bool get quizCompleted => _quizCompleted;

  // Getter method to retrieve the current score
  int get score => _score;

  // Method to handle answering a question
  void answerQuestion(int userAnswerIndex, BuildContext context,
      {bool isRetry = false, bool isSkipped = false}) {
    // Check if the quiz is not completed
    if (!_quizCompleted) {
      // Check if the question is not skipped
      if (!isSkipped) {
        // Check if the user's answer is correct
        if (userAnswerIndex == currentQuestion.answerIndex) {
          // Increment the score if the answer is correct
          _score++;
        } else {
          // Display a snack bar with the correct answer explanation
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Show the correct answer explanation
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      String answer = currentQuestion.explanation;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Answer'),
                            content: Text(answer),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Show Correct Answer'),
                  ),
                  // Show retry button if the question is retriable
                  if (currentQuestion.isRetriable && !isRetry)
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        // Retry the question
                        answerQuestion(
                          userAnswerIndex,
                          context,
                          isRetry: true,
                        );
                      },
                      child: Text('Retry'),
                    ),
                  // Show skip button to move to the next question
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      // Move to the next question
                      _currentQuestionIndex++;
                      // Check if the quiz is completed
                      if (_currentQuestionIndex >= questions.length) {
                        _quizCompleted = true;
                        // Show dialog with quiz completion message
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Quiz Completed'),
                            content: Text('Your final score is $_score.'),
                            actions: [
                              // Button to restart the quiz
                              TextButton(
                                onPressed: () {
                                  _currentQuestionIndex = 0;
                                  _score = 0;
                                  _quizCompleted = false;
                                  Navigator.pop(context);
                                  // Notify listeners
                                  notifyListeners();
                                },
                                child: Text('Restart'),
                              ),
                              // Button to exit the quiz
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Notify listeners
                                  notifyListeners();
                                },
                                child: Text('Exit'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Notify listeners
                        notifyListeners();
                      }
                    },
                    child: Text('Skip'),
                  ),
                ],
              ),
              duration: Duration(seconds: 5),
            ),
          );
          return;
        }
      }

      // Check if the question is not retried and not skipped
      if (!isRetry && !isSkipped) {
        // Move to the next question
        _currentQuestionIndex++;
      }

      // Check if the quiz is completed
      if (_currentQuestionIndex >= questions.length) {
        _quizCompleted = true;
        // Show dialog with quiz completion message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Quiz Completed'),
            content: Text('Your final score is $_score.'),
            actions: [
              // Button to restart the quiz
              TextButton(
                onPressed: () {
                  _currentQuestionIndex = 0;
                  _score = 0;
                  _quizCompleted = false;
                  Navigator.pop(context);
                  // Notify listeners
                  notifyListeners();
                },
                child: Text('Restart'),
              ),
              // Button to exit the quiz
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Exit'),
              ),
            ],
          ),
        );
      }
    } else {
      // Show dialog indicating that the quiz is already completed
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('You have already completed the quiz.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
