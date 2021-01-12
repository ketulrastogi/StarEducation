import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class SubjectQuizScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _questionList = [];
  List<Map<String, dynamic>> get questionList => _questionList;

  loadData(Map<String, dynamic> quizDetails) async {
    try {
      Map<String, dynamic> response = await _subjectService.getSubjectQuiz(
        quizDetails['quiz_id'],
      );
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No quiz available for Selected Subject. ');
      } else {
        _questionList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting quiz for Selected Subjects. $e.');
    }
  }
}
