import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class GetCustomQuizScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  Map<String, dynamic> _quizData;
  Map<String, dynamic> get quizData => _quizData;

  int _oneWord = 0;
  int get oneWord => _oneWord;
  int _multiple = 0;
  int get multiple => _multiple;
  int _trueFalse = 0;
  int get trueFalse => _trueFalse;

  setOneWord(int value) {
    _oneWord = value;
    notifyListeners();
  }

  setTrueFalse(int value) {
    _trueFalse = value;
    notifyListeners();
  }

  setMultiple(int value) {
    _multiple = value;
    notifyListeners();
  }

  loadData(String subjectId, String selectedTopicIds) async {
    try {
      Map<String, dynamic> response = await _subjectService
          .getCustomQuizCounter(subjectId, selectedTopicIds);
      if (!response['result']) {
        _snackbarService.showSnackbar(
            message: 'No quiz data available for Selected topics. ');
      } else {
        _quizData = response;
        print('QuizData: $quizData');
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting quiz data for Selected topics. $e.');
    }
  }

  startQuiz(String subjectId, String topicIdList) {
    print(
        'Multiple: ${_multiple.runtimeType}, ${quizData['multiple'].runtimeType}');
    if (_multiple > quizData['multiple'] &&
        _oneWord > quizData['one_word'] &&
        _trueFalse > quizData['true_false']) {
      _snackbarService.showSnackbar(
          message:
              'No of questions must be less than or equal to available questions.');
    } else {
      _navigationService.navigateTo(
        Routes.customQuizQuestionScreenViewRoute,
        arguments: CustomQuizQuestionScreenViewArguments(
          mutliple: _multiple.toString(),
          oneWord: _oneWord.toString(),
          trueFalse: _trueFalse.toString(),
          subjectId: subjectId,
          topicIdList: topicIdList,
        ),
      );
    }
  }
}
