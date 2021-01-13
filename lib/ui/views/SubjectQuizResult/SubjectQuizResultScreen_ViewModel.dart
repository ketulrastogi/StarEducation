import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class SubjectQuizResultScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _questionList = [];
  List<Map<String, dynamic>> get questionList => _questionList;

  String _correctAnswer;
  String get correctAnswer => _correctAnswer;
  String _wrongAnswer;
  String get wrongAnswer => _wrongAnswer;
  String _yourScore;
  String get yourScore => _yourScore;
  loadData(
    String quizId,
    String quizType,
  ) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getResult(quizId, quizType);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No quiz available for Selected Subject. ');
      } else {
        _correctAnswer = response['data']['correct_answer'];
        _wrongAnswer = response['data']['wrong_answer'];
        _yourScore = response['data']['total_score'];
        _questionList = [...response['data']['question_list']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting quiz for Selected Subjects. $e.');
    }
  }
}
