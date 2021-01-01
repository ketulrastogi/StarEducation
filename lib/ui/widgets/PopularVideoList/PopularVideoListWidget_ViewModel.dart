import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stareducation/services/firebase_auth_service.dart';
import 'package:stareducation/app/locator.dart';
import 'package:stareducation/app/routes.gr.dart';
import 'package:stareducation/services/subject_service.dart';

class PopularVideoListWidgetViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SubjectService _subjectService = locator<SubjectService>();

  List<Map<String, dynamic>> _popularVideoList = [];
  List<Map<String, dynamic>> get popularVideoList => _popularVideoList;

  getPopularVideos() async {
    try {
      Map<String, dynamic> response =
          await _subjectService.getPopularVideo('4');
      if (!response['result'] || response['data'] == null) {
        _snackbarService.showSnackbar(
            message: 'No popular videos available right now. ');
      } else {
        _popularVideoList = [...response['data']];
        notifyListeners();
      }
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An error occured while getting Popular Videos. $e.');
    }
  }
}
