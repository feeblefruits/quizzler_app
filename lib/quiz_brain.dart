import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        q: 'One COVID-19 infected person infects about 2.5 other people.',
        a: true),
    Question(
        q: 'Patients with COVID-19 can take anti-inflammatory medicine like ibuprofen, aspirin or naproxen.',
        a: true),
    Question(
        q: 'Once infected with the coronavirus, it can take 2 to 14 days to show symptoms.',
        a: true),
    Question(
        q: 'Hand sanitizer doesn’t kill coronavirus because it’s antibacterial, not antiviral.',
        a: false),
    Question(
        q: '“If you have a runny nose and sputum, you have a common cold,” not COVID-19.',
        a: false),
    Question(
        q: 'Researcher Judy Mikovits was thrown in jail after she refused to discredit research that led to the discovery that deadly retroviruses have been transmitted through vaccines.',
        a: false),
    Question(
        q: 'The fact that the 5G network was rolled out in the Chinese city of Wuhan just a few weeks before the coronavirus came on the scene, proves that the cellular technology is behind the spread of Covid-19',
        a: false),
    Question(
        q: 'Researcher Judy Mikovits was arrested without a warrant and jailed without charges for making a controversial scientific discovery.',
        a: false),
    Question(q: 'Healthy people should practice social distancing.', a: true),
    Question(
        q: 'During a shelter-in-place order, my kids can be with other kids in small groups.',
        a: false),
    Question(
        q: 'Anyone with COVID-19 symptoms, regardless of their overall health, should seek testing',
        a: false),
    Question(
        q: 'Bill Gates — along with a coalition dubbed "ID 2020" — seeks to "microchip" the world population using a COVID-19 vaccine.',
        a: false),
    Question(q: 'A loss of smell or taste is a symptom of COVID-19.', a: true),
    Question(
        q: 'A sprawling conspiracy theory proves numerous individuals and organizations schemed to promote the drug Remdesivir as a COVID-19 treatment over the purportedly highly effective Hydroxychloroquine.',
        a: false),
    Question(
        q: 'If you can hold your breath for 10 seconds, you don’t have COVID-19.',
        a: true)
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
}
