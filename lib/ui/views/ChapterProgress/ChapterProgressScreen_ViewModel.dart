import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';

class ChapterProgressScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _chapterProgressList = [];
  List<Map<String, dynamic>> get chapterProgressList => _chapterProgressList;

  loadData(String subjectId) async {
    setBusy(true);
    try {
      Map<String, dynamic> response =
          await _subjectService.getProgress(subjectId);
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message:
                'No chapters progress data available for Selected Subject. ');
      } else {
        _chapterProgressList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message:
              'An error occured while getting Chapters Progress Data. $e.');
    }
    setBusy(false);
  }
}
