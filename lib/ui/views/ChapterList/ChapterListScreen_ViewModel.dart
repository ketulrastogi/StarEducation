import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/subject_service.dart';

class ChapterListScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  final String imageBaseUrl =
      'http://sampleserver.org/starmath/uploads/thumbnails/topic_thumbnails/';

  List<Map<String, dynamic>> _chapterList = [];
  List<Map<String, dynamic>> get chapterList => _chapterList;

  Map<String, dynamic> _lastTopicDetails;
  Map<String, dynamic> get lastTopicDetails => _lastTopicDetails;

  loadData() async {
    await getChapterList('4');
    await getLastTopicDetails('4');
  }

  getChapterList(String subjectId) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getChapterList(subjectId);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No chapters available for Selected Subject. ');
      } else {
        _chapterList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting Chapters for Selected Subjects. $e.');
    }
  }

  getLastTopicDetails(String subjectId) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.lastVisitTopic(subjectId);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No recent chapters available for Selected Subject. ');
      } else {
        _lastTopicDetails = response['data'];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting Recent Chapters for Selected Subjects. $e.');
    }
  }
}
