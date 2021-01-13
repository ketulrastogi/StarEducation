import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class CustomSubjectQuizSelectChaptersAndTopicsScreenViewModel
    extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();
  Map<String, dynamic> _boardMediumStandardList;
  Map<String, dynamic> get boardMediumStandardList => _boardMediumStandardList;

  List<String> _myActivities;
  List<String> get myActivities => _myActivities;

  Map<String, dynamic> _selectedSubject;
  Map<String, dynamic> get selectedSubject => _selectedSubject;

  List<Map<String, dynamic>> _chapterList = [];
  List<Map<String, dynamic>> get chapterList => _chapterList;

  List<String> _selectedChapterIdList = [];
  List<String> get selectedChapterIdList => _selectedChapterIdList;

  List<String> _selectedChapterTextList = [];
  List<String> get selectedChapterTextList => _selectedChapterTextList;

  List<String> _selectedTopicIdList = [];
  List<String> get selectedTopicIdList => _selectedTopicIdList;

  List<String> _selectedTopicTextList = [];
  List<String> get selectedTopicTextList => _selectedTopicTextList;

  List<Map<String, dynamic>> _selectedChapterList = [];
  List<Map<String, dynamic>> get selectedChapterList => _selectedChapterList;

  List<Map<String, dynamic>> _topicList = [];
  List<Map<String, dynamic>> get topicList => _topicList;

  List<Map<String, dynamic>> _selectedTopicList = [];
  List<Map<String, dynamic>> get selectedTopicList => _selectedTopicList;

  setSelectedChapterTextList(List<String> values) {
    _selectedTopicList = [];
    _selectedTopicTextList = [];
    _selectedTopicIdList = [];
    _topicList = [];
    _selectedChapterList = [];
    _selectedChapterTextList = [];
    // print('ViewModel: 51');
    if (values.length == 0) {
      _selectedChapterList = [];
      _selectedChapterIdList = [];
      _selectedChapterTextList = [];
      _topicList = [];
      _selectedTopicIdList = [];
      _selectedTopicTextList = [];
      _selectedTopicList = [];
      // print('ViewModel: 60');
    } else {
      _selectedChapterIdList = [...values];
      // print('ViewModel: 62');
      _selectedChapterIdList.forEach((selectedChapterId) => _selectedChapterList
              .addAll([
            ..._chapterList
                .where((chapter) => chapter['chap_id'] == selectedChapterId)
          ]));
      // print('ViewModel: 68');
      _selectedChapterTextList = [
        ..._selectedChapterList
            .map((selectedChapter) => selectedChapter['chapter_name'])
            .toList()
      ];
      // print('ViewModel: 74');
      _selectedChapterList.forEach((selectedChapter) {
        [...selectedChapter['topic']].forEach((topic) {
          _topicList.add(topic);
        });
      });
      // print('ViewModel: 80');
      // print('SelectedChapterTextList: $_selectedChapterTextList');
      // print('SelectedTopicList: $_topicList');
    }
    notifyListeners();
  }

  setSelectedTopicTextList(List<String> values) {
    _selectedTopicIdList = [...values];
    _selectedTopicList = [];
    _selectedTopicTextList = [];
    // print('TopicListSelectedValues: $values');
    // print('ViewModel: 92');
    [...values].forEach((topicId) => _selectedTopicList
        .add(_topicList.where((topic) => topic['top_id'] == topicId)?.first));
    // print('ViewModel: 95');
    _selectedTopicTextList = [
      ..._selectedTopicList
          .map((selectedTopic) => selectedTopic['topic_name'])
          .toList()
    ];
    // print('ViewModel: 101');
    // [...values].forEach((topicId) => _selectedTopicTextList.add(_topicList
    //     .firstWhere((topic) => topic['top_id'] == topicId)['topic_name']));

    // print('SelectedTopicTextList: $_selectedTopicTextList');
    // print('SelectedTopicIdList: $_selectedTopicIdList');
    notifyListeners();
  }

  getChapterListFromBackend(Map<String, dynamic> subjectDetails) async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getChapterList(subjectDetails['sub_id']);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No recent chapters available for Selected Subject. ');
      } else {
        _chapterList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting Recent Chapters for Selected Subjects. $e.');
    }
  }

  navigateToGetCustomQuizScreen(String subjectId) {
    String _selectedIds = _selectedTopicIdList
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");
    print('SelectedIds: $_selectedIds');

    _navigationService.navigateTo(Routes.getCustomQuizScreenViewRoute,
        arguments: GetCustomQuizScreenViewArguments(
            subjectId: subjectId, topicIdList: _selectedIds));
  }

  navigateToCustomQuizOldResultScreen(String subjectId) {
    _navigationService.navigateTo(Routes.customQuizOldResultScreenViewRoute,
        arguments:
            CustomQuizOldResultScreenViewArguments(subjectId: subjectId));
  }
}
