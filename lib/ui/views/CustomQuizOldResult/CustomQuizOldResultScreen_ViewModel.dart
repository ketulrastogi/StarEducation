import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class CustomQuizOldResultScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _quizResultList = [];
  List<Map<String, dynamic>> get quizResultList => _quizResultList;

  loadData(String subjectId) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getCustomQuizList(subjectId);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No custom quiz results available for Selected subject. ');
      } else {
        _quizResultList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting custom quiz results for selected subject. $e.');
    }
  }

  navigateToCustomQuizOldResultScreen(String quizId) {
    _navigationService.navigateTo(
      Routes.subjectQuizResultScreenViewRoute,
      arguments: SubjectQuizResultScreenViewArguments(
          quizId: quizId, quizType: 'custom_quiz'),
    );
  }
}
