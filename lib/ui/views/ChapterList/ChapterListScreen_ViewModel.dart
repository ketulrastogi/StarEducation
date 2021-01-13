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

  loadData(Map<String, dynamic> subjectDetails) async {
    await getChapterList(subjectDetails['sub_id']);
    await getLastTopicDetails(subjectDetails['sub_id']);
  }

  navigateToTopicDetailsScreen(Map<String, dynamic> topicDetails) async {
    await _navigationService.navigateTo(
      Routes.topicDetailsScreenViewRoute,
      arguments: TopicDetailsScreenViewArguments(topicDetails: topicDetails),
    );
    notifyListeners();
  }

  setLastTopicInfo(Map<String, dynamic> subjectDetails,
      Map<String, dynamic> topicDetails) async {
    try {
      Map<String, dynamic> response = await _subjectService.setLastTopicDetail(
          subjectDetails['sub_id'], topicDetails['top_id']);
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

  navigateToChapterProgressScreen(Map<String, dynamic> subjectDetails) {
    _navigationService.navigateTo(
      Routes.chapterProgressScreenViewRoute,
      arguments:
          ChapterProgressScreenViewArguments(subjectDetails: subjectDetails),
    );
  }

  navigateToSubjectQuizListScreen(Map<String, dynamic> subjectDetails) {
    _navigationService.navigateTo(
      Routes.subjectQuizListScreenViewRoute,
      arguments:
          SubjectQuizListScreenViewArguments(subjectDetails: subjectDetails),
    );
  }

  navigateToCustomSubjectQuizSelectChaptersAndTopicsScreen(
      Map<String, dynamic> subjectDetails) {
    _navigationService.navigateTo(
      Routes.customSubjectQuizSelectChaptersAndTopicsScreenViewRoute,
      arguments: CustomSubjectQuizSelectChaptersAndTopicsScreenViewArguments(
          subjectDetails: subjectDetails),
    );
  }
}
