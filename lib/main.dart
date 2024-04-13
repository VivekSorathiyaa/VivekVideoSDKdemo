import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivek_videosdk/quiz_page.dart'; // Import QuizPage widget
import 'model.dart'; // Import the Question model
import 'provider.dart'; // Import the QuizProvider class

void main() {
  runApp(
    // Wrap the entire app with a ChangeNotifierProvider to provide the QuizProvider instance
    ChangeNotifierProvider(
      // Create a new instance of QuizProvider and provide it to the app
      create: (context) => QuizProvider(
        // Define the list of questions for the quiz
        questions: [
          // Define each question as a Question object
          Question(
            text: 'What is the capital of India?',
            choices: ['Delhi', 'Mumbai', 'Kolkata', 'Chennai'],
            answerIndex: 0,
            explanation: 'Delhi is the capital of India.',
            isRetriable: true,
          ),
          Question(
            text: 'Which river is known as the "Ganga" in India?',
            choices: ['Yamuna', 'Brahmaputra', 'Indus', 'Ganges'],
            answerIndex: 3,
            explanation: 'The Ganges river is known as the "Ganga" in India.',
            isRetriable: true,
          ),
          Question(
            text: 'Who was the first Prime Minister of India?',
            choices: [
              'Jawaharlal Nehru',
              'Mahatma Gandhi',
              'Indira Gandhi',
              'Sardar Patel'
            ],
            answerIndex: 0,
            explanation:
                'Jawaharlal Nehru was the first Prime Minister of India.',
            isRetriable: true,
          ),
          Question(
            text: 'Which is the national animal of India?',
            choices: ['Elephant', 'Tiger', 'Lion', 'Leopard'],
            answerIndex: 1,
            explanation: 'The tiger is the national animal of India.',
            isRetriable: true,
          ),
          Question(
            text: 'What is the currency of India?',
            choices: ['Dollar', 'Rupee', 'Yen', 'Pound'],
            answerIndex: 1,
            explanation: 'The currency of India is the Rupee.',
            isRetriable: true,
          ),
          Question(
            text:
                'Which monument is also known as the "Symbol of Love" in India?',
            choices: ['Hawa Mahal', 'Taj Mahal', 'Qutub Minar', 'Red Fort'],
            answerIndex: 1,
            explanation:
                'The Taj Mahal is also known as the "Symbol of Love" in India.',
            isRetriable: true,
          ),
          Question(
            text: 'Who wrote the Indian national anthem, "Jana Gana Mana"?',
            choices: [
              'Rabindranath Tagore',
              'Mahatma Gandhi',
              'Jawaharlal Nehru',
              'Sardar Patel'
            ],
            answerIndex: 0,
            explanation:
                'Rabindranath Tagore wrote the Indian national anthem, "Jana Gana Mana".',
            isRetriable: true,
          ),
          Question(
            text: 'Which Indian state is known as the "Land of Five Rivers"?',
            choices: ['Punjab', 'Rajasthan', 'Gujarat', 'Maharashtra'],
            answerIndex: 0,
            explanation:
                'Punjab is known as the "Land of Five Rivers" in India.',
            isRetriable: true,
          ),
          Question(
            text: 'Who was known as the "Father of the Indian Constitution"?',
            choices: [
              'Mahatma Gandhi',
              'B.R. Ambedkar',
              'Jawaharlal Nehru',
              'Sardar Patel'
            ],
            answerIndex: 1,
            explanation:
                'B.R. Ambedkar was known as the "Father of the Indian Constitution".',
            isRetriable: true,
          ),
          Question(
            text:
                'Which Indian city is famous for the annual festival of Durga Puja?',
            choices: ['Varanasi', 'Kolkata', 'Jaipur', 'Mumbai'],
            answerIndex: 1,
            explanation:
                'Kolkata is famous for the annual festival of Durga Puja.',
            isRetriable: true,
          ),
        ],
      ),
      // Define the root widget of the app, which is MaterialApp
      child: MaterialApp(
        title: 'Quiz App', // Title of the app
        theme: ThemeData(
          primarySwatch: Colors.blue, // Define the primary color theme
        ),
        home: QuizPage(), // Set QuizPage as the home screen of the app
      ),
    ),
  );
}
