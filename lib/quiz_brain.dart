import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        questionText:
            'One COVID-19 infected person infects about 2.5 other people.',
        questionAnswer: true),
    Question(
        questionText:
            'Patients with COVID-19 can take anti-inflammatory medicine like ibuprofen, aspirin or naproxen.',
        questionAnswer: true),
    Question(
        questionText:
            'Once infected with the coronavirus, it can take 2 to 14 days to show symptoms.',
        questionAnswer: true),
    Question(
        questionText:
            'Hand sanitizer doesn’t kill coronavirus because it’s antibacterial, not antiviral.',
        questionAnswer: false),
    Question(
        questionText:
            'Researcher Judy Mikovits was thrown in jail after she refused to discredit research that led to the discovery that deadly retroviruses have been transmitted through vaccines.',
        questionAnswer: false),
    Question(
        questionText:
            'The fact that the 5G network was rolled out in the Chinese city of Wuhan just a few weeks before the coronavirus came on the scene, proves that the cellular technology is behind the spread of Covid-19',
        questionAnswer: false),
    Question(
        questionText:
            'Researcher Judy Mikovits was arrested without a warrant and jailed without charges for making a controversial scientific discovery.',
        questionAnswer: false),
    Question(
        questionText: 'Healthy people should practice social distancing.',
        questionAnswer: true),
    Question(
        questionText:
            'During a shelter-in-place order, my kids can be with other kids in small groups.',
        questionAnswer: false),
    Question(
        questionText:
            'Anyone with COVID-19 symptoms, regardless of their overall health, should seek testing',
        questionAnswer: false),
    Question(
        questionText:
            'Bill Gates — along with a coalition dubbed "ID 2020" — seeks to "microchip" the world population using a COVID-19 vaccine.',
        questionAnswer: false),
    Question(
        questionText: 'A loss of smell or taste is a symptom of COVID-19.',
        questionAnswer: true),
    Question(
        questionText:
            'A sprawling conspiracy theory proves numerous individuals and organizations schemed to promote the drug Remdesivir as a COVID-19 treatment over the purportedly highly effective Hydroxychloroquine.',
        questionAnswer: false),
    Question(
        questionText:
            'If you can hold your breath for 10 seconds, you don’t have COVID-19.',
        questionAnswer: true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  int questionBankLength() {
    return _questionBank.length;
  }

  String correctAnswerLength() {
    var correctAnswerCount =
        _questionBank.where((c) => c.questionAnswer == true).toList().length;

    return ((correctAnswerCount / questionBankLength()) * 100)
        .toStringAsFixed(0);
  }

  void reset() {
    _questionNumber = 0;
  }
}
