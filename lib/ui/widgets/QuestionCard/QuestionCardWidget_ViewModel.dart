import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class QuestionCardWidgetViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _questionList = [];
  List<Map<String, dynamic>> get questionList => _questionList;

  List<Map<String, dynamic>> _answerList = [];
  List<Map<String, dynamic>> get answerList => _answerList;

  Map<String, dynamic> _question;
  Map<String, dynamic> get question => _question;

  bool _hintVisible = false;
  bool get hintVisible => _hintVisible;

  bool _answerVisible = false;
  bool get answerVisible => _answerVisible;

  String _answer;
  String get answer => _answer;

  String _exerciseId;
  String get exerciseId => _exerciseId;

  String _questionType;
  String get questionType => _questionType;

  String _message = '';
  String get message => _message;

  Map<String, dynamic> _currentQuestion;
  Map<String, dynamic> get currentQuestion => _currentQuestion;

  int _correctAnswer = 0;
  int get correctAnswer => _correctAnswer;
  int _wrongAnswer = 0;
  int get wrongAnswer => _wrongAnswer;
  int _totalScore = 0;
  int get totalScore => _totalScore;
  int _totalQuestion = 0;
  int get totalQuestion => _totalQuestion;

  setHintVisibility() {
    _hintVisible = !_hintVisible;
    notifyListeners();
  }

  setAnswerVisibility(bool value) {
    _answerVisible = value;
    notifyListeners();
  }

  setAnswer(String value) {
    _answer = value;
    _answerVisible = true;
    if (_answer == _currentQuestion['correct_answers']) {
      _correctAnswer = _correctAnswer + 1;
    } else {
      _wrongAnswer = _wrongAnswer + 1;
    }
    addAnswerToTheList();
    notifyListeners();
  }

  setCurrentQuestion(Map<String, dynamic> value) {
    _currentQuestion = value;
    notifyListeners();
  }

  loadQuestion(
      String exerciseId, String questionGroup, String questionType) async {
    Map<String, dynamic> response;
    print('QuestionGroup: $questionGroup');
    print('QuestionType: $questionType');
    print('Exercise Id: $exerciseId');
    try {
      if (questionGroup.toLowerCase() == 'exercise') {
        if (questionType.toLowerCase() == 'see') {
          response = await _subjectService.getSeeQuestionList(exerciseId);
        }
        if (questionType.toLowerCase() == 'try') {
          response = await _subjectService.getTryQuestionList(exerciseId);
        }
        if (questionType.toLowerCase() == 'apply') {
          response = await _subjectService.getApplyQuestionList(exerciseId);
        }
      }
      if (questionGroup.toLowerCase() == 'task') {
        response = await _subjectService.getTaskQuestion(exerciseId);
      }
      if (questionGroup.toLowerCase() == 'quiz') {
        response = await _subjectService.getSubjectQuiz(exerciseId);
      }

      print('TopicId: $exerciseId');
      print('QuestionGroup: $questionGroup');
      print('Response: $response');
      // _message = response['message'];
      notifyListeners();

      if (response == null ||
          response['result'] &&
              !response.containsKey('data') &&
              response['data'] == null) {
        _snackbarService.showSnackbar(message: response['message']);
      } else {
        if (!response['result'] || response['data'] == null) {
          _snackbarService.showSnackbar(
              message: 'No questions available for Selected Exercise. ');
        } else {
          _message = response['message'];
          _questionList = [...response['data']];
          setCurrentQuestion(_questionList[0]);
          notifyListeners();
        }
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting questions for selected exercise. $e.');
    }
  }

  addAnswerToTheList() {
    Map<String, dynamic> oldAnswer = _answerList.firstWhere(
        (element) => element['id'] == _currentQuestion['id'],
        orElse: () => null);

    if (oldAnswer != null) {
      int index = _answerList.indexOf(oldAnswer);
      _answerList[index]['yourAnswer'] = _answer;
    } else {
      _answerList.add({
        ..._currentQuestion,
        'yourAnswer': _answer,
      });
    }
    print('Answers ${_answerList.length} :  $_answerList');
  }

  submitQuestionsAndSetQuizScore(
    String exerciseId,
    String questionType,
  ) async {
    Map<String, dynamic> response;

    _correctAnswer = _answerList
        .where((element) => element['correct_answers'] == element['yourAnswer'])
        .length;
    _wrongAnswer = _answerList
        .where((element) => element['correct_answers'] != element['yourAnswer'])
        .length;
    _totalScore = _correctAnswer;
    _totalQuestion = _questionList.length;

    if (_questionList.length == _answerList.length) {
      try {
        response = await _subjectService.setQuizScore(
          exerciseId,
          questionType,
          _correctAnswer.toString(),
          _wrongAnswer.toString(),
          _totalScore.toString(),
          _totalQuestion.toString(),
        );

        print('Response: $response');

        if (response == null || !response['result']) {
          _snackbarService.showSnackbar(
              message: 'An error occured while submitting answers. ');
        } else {
          _navigationService.popRepeated(1);

          if (_questionType == 'see') {
            _navigationService.navigateTo(
              Routes.exerciseQuestionScreenViewRoute,
              arguments: ExerciseQuestionScreenViewArguments(
                exerciseId: _exerciseId,
                questionTypeColor: getQuestionColor(),
                questionType: 'try',
              ),
            );
          }

          if (_questionType == 'try') {
            _navigationService.navigateTo(
              Routes.exerciseQuestionScreenViewRoute,
              arguments: ExerciseQuestionScreenViewArguments(
                exerciseId: _exerciseId,
                questionTypeColor: getQuestionColor(),
                questionType: 'apply',
              ),
            );
          }
        }
      } catch (e) {
        _snackbarService.showSnackbar(
            message:
                'An error occured while getting questions for selected exercise. $e.');
      }
    } else {
      _snackbarService.showSnackbar(
          message: 'Please answer all questions before submitting.');
    }
  }

  getQuestionColor() {
    if (_questionType == 'see') {
      return Colors.yellow.shade800;
    } else if (_questionType.toLowerCase() == 'try') {
      return Colors.green;
    } else if (_questionType.toLowerCase() == 'apply') {
      return Colors.red;
    }
  }
}
