// Define a class to represent a quiz question
class Question {
  // Properties of the question
  String text; // The text of the question
  List<String> choices; // List of choices for the question
  int answerIndex; // Index of the correct answer in the choices list
  String explanation; // Explanation of the correct answer
  bool isRetriable; // Indicates if the question can be retried
  bool isRemedial; // Indicates if the question is remedial

  // Constructor to initialize the properties of the question
  Question({
    required this.text, // Required parameter for the question text
    required this.choices, // Required parameter for the list of choices
    required this.answerIndex, // Required parameter for the index of the correct answer
    this.explanation =
        '', // Optional parameter for the explanation of the correct answer (default value is an empty string)
    this.isRetriable =
        false, // Optional parameter to indicate if the question can be retried (default value is false)
    this.isRemedial =
        false, // Optional parameter to indicate if the question is remedial (default value is false)
  });
}
