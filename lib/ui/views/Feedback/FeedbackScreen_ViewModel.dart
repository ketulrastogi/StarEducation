import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/services/subject_service.dart';
import 'package:stareducation/app/routes.gr.dart';

class FeedbackScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();
  String _title;
  String get title => _title;
  String _expertCode;
  String get expertCode => _expertCode;
  String _description;
  String get description => _description;

  setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  setExpertCode(String value) {
    _expertCode = value;
    notifyListeners();
  }

  setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  submitFeedback() async {
    setBusy(true);
    print(
        'Title: $_title, ExpertCode: $_expertCode, Description: _description');
    try {
      Map<String, dynamic> response =
          await _subjectService.setFeedback(_title, _expertCode, _description);
      if (!response['result']) {
        _snackbarService.showSnackbar(
            message: 'Feedback submission is failed. Please try again. ');
      } else {
        _navigationService.popRepeated(1);
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while submittin feedback. $e.');
    }
    setBusy(false);
  }
}
