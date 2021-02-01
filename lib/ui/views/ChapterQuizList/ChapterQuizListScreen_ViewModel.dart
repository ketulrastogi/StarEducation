import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class ChapterQuizListScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _quizList = [];
  List<Map<String, dynamic>> get quizList => _quizList;

  loadData(Map<String, dynamic> chapterDetails) async {
    try {
      Map<String, dynamic> response = await _subjectService.getChapterQuizList(
        chapterDetails['chap_id'],
      );
      print('Subject Details: $chapterDetails');
      print('Response: $response');
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No quiz available for Selected Chapter. ');
      } else {
        _quizList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting quiz for Selected Chapter. $e.');
    }
  }

  navigateToSubjectQuizScreenOrResultScreen(
    Map<String, dynamic> quizDetails,
  ) {
    if (quizDetails['score'] == '') {
      _navigationService.navigateTo(
        Routes.SubjectQuizScreenViewRoute,
        arguments: SubjectQuizScreenViewArguments(
          quizDetails: quizDetails,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.subjectQuizResultScreenViewRoute,
        arguments: SubjectQuizResultScreenViewArguments(
            quizId: quizDetails['quiz_id'], quizType: 'subject_quiz'),
      );
    }
  }
}
