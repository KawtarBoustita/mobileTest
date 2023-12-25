import 'question.dart';

class AppBrain {
  int _questionNumber = 0;

  List<Question> _questionGroup = [
    Question(
      //q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
      q: 'The number of planets in the solar system is eight planets',
      i: 'images/image-1.jpg',
      a: true,
    ),
    Question(
      //q: 'القطط هي حيوانات لاحمة',
      q: 'Cats are carnivores',
      i: 'images/image-2.jpg',
      a: true,
    ),
    Question(
      //q: 'الصين موجودة في القارة الإفريقية',
      q: 'China is present on the African continent',
      i: 'images/image-3.jpg',
      a: false,
    ),
    Question(
      //q: 'الأرض مسطحة وليست كروية',
      q: 'The Earth is flat, not spherical',
      i: 'images/image-4.jpg',
      a: false,
    ),
    Question(
        //q: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
        q: 'Can humans survive without eating meat?',
        i: 'images/image-5.jpg',
        a: true),
    Question(
        //q: 'الشمس تدور حول الأرض والأرض تدور حول القمر',
        q: 'The sun revolves around the earth and the earth revolves around the moon',
        i: 'images/image-6.jpg',
        a: false),
    Question(
        q: 'Animals do not feel pain',
        //q: 'الحيوانات لا تشعر بالألم',
        i: 'images/image-7.jpg',
        a: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      //questiongroup.lenght ==7
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
